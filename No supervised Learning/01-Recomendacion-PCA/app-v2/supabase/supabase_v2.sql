-- =====================================================================
--  Off-script v2 · ejecutar UNA vez en Supabase → SQL Editor → Run
--  Se suma a lo de la versión 1 (tabla ratings y vista ratings_stats).
-- =====================================================================

create extension if not exists pgcrypto with schema extensions;

-- ---------- 1. Calificaciones: fecha de última edición ----------
alter table public.ratings add column if not exists updated_at timestamptz not null default now();

-- ---------- 2. Cuentas con usuario y contraseña (sin correo) ----------
-- Cada navegador tiene una sesión anónima de Supabase ("dispositivo").
-- Al crear cuenta o entrar, ese dispositivo se vincula al usuario; así se comparten
-- calificaciones y programas entre todos los dispositivos de la misma cuenta.
create table if not exists public.cuentas (
  usuario text primary key,
  clave text not null,                      -- hash bcrypt, nunca la contraseña
  created_at timestamptz not null default now()
);
create table if not exists public.dispositivos (
  uid uuid primary key,
  usuario text not null references public.cuentas(usuario) on delete cascade,
  created_at timestamptz not null default now()
);
alter table public.cuentas enable row level security;       -- sin políticas: nadie las lee directo
alter table public.dispositivos enable row level security;

-- uids de todos los dispositivos de mi cuenta (o solo el mío si soy invitado)
create or replace function public.mis_uids() returns setof uuid
language sql stable security definer set search_path = public as $$
  select auth.uid()
  union
  select d2.uid from public.dispositivos d1
  join public.dispositivos d2 on d2.usuario = d1.usuario
  where d1.uid = auth.uid();
$$;

create or replace function public.mi_usuario() returns text
language sql stable security definer set search_path = public as $$
  select usuario from public.dispositivos where uid = auth.uid();
$$;

create or replace function public.registrar(p_usuario text, p_clave text) returns text
language plpgsql security definer set search_path = public, extensions as $$
declare u text := lower(trim(p_usuario));
begin
  if auth.uid() is null then raise exception 'No hay sesión. Recarga la página.'; end if;
  if u !~ '^[a-z0-9_.]{3,20}$' then
    raise exception 'El usuario debe tener de 3 a 20 caracteres: letras, números, punto o guion bajo.';
  end if;
  if length(coalesce(p_clave, '')) < 6 then raise exception 'La contraseña debe tener al menos 6 caracteres.'; end if;
  if exists (select 1 from public.cuentas where usuario = u) then raise exception 'Ese usuario ya existe. Elige otro o entra con él.'; end if;
  insert into public.cuentas (usuario, clave) values (u, crypt(p_clave, gen_salt('bf')));
  insert into public.dispositivos (uid, usuario) values (auth.uid(), u)
    on conflict (uid) do update set usuario = excluded.usuario;
  return u;
end $$;

create or replace function public.entrar(p_usuario text, p_clave text) returns text
language plpgsql security definer set search_path = public, extensions as $$
declare u text := lower(trim(p_usuario)); h text;
begin
  if auth.uid() is null then raise exception 'No hay sesión. Recarga la página.'; end if;
  select clave into h from public.cuentas where usuario = u;
  if h is null or h <> crypt(p_clave, h) then
    perform pg_sleep(0.5);                   -- frena intentos a ciegas
    raise exception 'Usuario o contraseña incorrectos.';
  end if;
  insert into public.dispositivos (uid, usuario) values (auth.uid(), u)
    on conflict (uid) do update set usuario = excluded.usuario;
  return u;
end $$;

-- Cerrar sesión no desvincula el dispositivo: lo que calificaste ahí sigue siendo de tu cuenta.
-- El navegador solo descarta su sesión y la siguiente visita empieza como invitado nuevo.
drop function if exists public.salir();

-- Mis calificaciones de todos mis dispositivos (para sincronizar al entrar)
create or replace function public.mis_calificaciones() returns setof public.ratings
language sql stable security definer set search_path = public as $$
  select * from public.ratings where user_id in (select public.mis_uids());
$$;

grant execute on function public.mis_uids(), public.mi_usuario(), public.mis_calificaciones() to authenticated;
grant execute on function public.registrar(text, text), public.entrar(text, text) to authenticated;

-- Las calificaciones de cualquier dispositivo de mi cuenta las puedo editar o borrar
drop policy if exists "cada quien edita lo suyo" on public.ratings;
drop policy if exists "cada quien borra lo suyo" on public.ratings;
create policy "cada quien edita lo suyo" on public.ratings for update to authenticated
  using (user_id in (select public.mis_uids())) with check (user_id = auth.uid());
create policy "cada quien borra lo suyo" on public.ratings for delete to authenticated
  using (user_id in (select public.mis_uids()));

-- ---------- 3. Programas (Mi estante) ----------
create table if not exists public.programs (
  id bigint generated always as identity primary key,
  created_at timestamptz not null default now(),
  user_id uuid not null default auth.uid(),
  domain text not null check (domain in ('movies', 'books')),
  items jsonb not null                      -- [{ "id": "...", "p": 4.3 }, ...]
);
alter table public.programs enable row level security;
drop policy if exists "veo mis programas" on public.programs;
drop policy if exists "guardo mis programas" on public.programs;
drop policy if exists "borro mis programas" on public.programs;
create policy "veo mis programas" on public.programs for select to authenticated using (user_id in (select public.mis_uids()));
create policy "guardo mis programas" on public.programs for insert to authenticated with check (user_id = auth.uid());
create policy "borro mis programas" on public.programs for delete to authenticated using (user_id in (select public.mis_uids()));

-- ---------- 4. Libros agregados por la comunidad (desde Open Library) ----------
create table if not exists public.community_books (
  id text primary key,                      -- 'ol' + clave de obra de Open Library, p. ej. olOL27448W
  ol_key text not null unique,
  title text not null,
  author text,
  year int,
  genres text[] not null default '{}',
  cover_url text,
  isbn text,
  hidden boolean not null default false,    -- para ocultar entradas basura desde el Table Editor
  added_by uuid not null default auth.uid(),
  created_at timestamptz not null default now()
);
alter table public.community_books enable row level security;
drop policy if exists "todos ven libros" on public.community_books;
drop policy if exists "cualquiera agrega" on public.community_books;
create policy "todos ven libros" on public.community_books for select using (not hidden);
create policy "cualquiera agrega" on public.community_books for insert to authenticated
  with check (added_by = auth.uid() and hidden = false);

-- Libros de la comunidad con cuántas calificaciones llevan
create or replace view public.community_books_v as
  select b.id, b.title, b.author, b.year, b.genres, b.cover_url, b.isbn, b.created_at,
         coalesce(s.n, 0) as n, coalesce(s.promedio, 0) as promedio
  from public.community_books b
  left join (select item_id, count(*) as n, avg(rating) as promedio
             from public.ratings where domain = 'books' group by item_id) s on s.item_id = b.id
  where not b.hidden;
grant select on public.community_books_v to anon, authenticated;

-- ---------- 5. Contador de personas: una cuenta cuenta como una persona aunque use varios dispositivos ----------
create or replace view public.ratings_stats as
  select count(*) as total,
         count(distinct coalesce(d.usuario, r.user_id::text)) as personas
  from public.ratings r left join public.dispositivos d on d.uid = r.user_id;
grant select on public.ratings_stats to anon, authenticated;
