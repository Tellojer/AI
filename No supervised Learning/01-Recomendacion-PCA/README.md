# Off-script: sistema de recomendación de películas y libros con PCA

¿Se pueden recomendar películas y libros a una persona a partir de unas cuantas calificaciones suyas y de los gustos de millones de lectores y cinéfilos?

Off-script es una aplicación web que recomienda títulos a partir de 10 calificaciones. El modelo es un análisis de componentes principales (PCA) aplicado a una matriz de calificaciones con huecos, técnica conocida como *matrix completion*. A cada calificación se le resta el promedio de quien la dio y el sesgo del título (doble centrado). Después, los huecos se rellenan de forma iterativa con la reconstrucción de la descomposición en valores singulares (SVD), cuyos valores singulares se encogen con SoftImpute, y quedan 200 componentes que funcionan como ejes de gusto. Cada nueva persona se ubica en ese espacio con una regresión regularizada sobre sus calificaciones, sin reentrenar el modelo. El orden final combina la calificación predicha, la similitud coseno con los títulos que la persona calificó por encima de su promedio, su afinidad con los géneros y un ajuste leve hacia títulos conocidos.

La versión 1 recomienda y guarda las calificaciones de la comunidad en una base de datos compartida (Supabase). La versión 2 agrega cuentas con usuario y contraseña, un estante personal y la opción de añadir libros y películas que no están en el catálogo.

**Resultado principal:** con el 10 % de las calificaciones escondidas, SoftImpute con 200 componentes obtiene el menor error (RMSE de 0.818 en libros, escala 1–5, y de 1.368 en películas, escala 1–10), frente a 0.858 y 1.549 del modelo base (promedio del usuario más sesgo del título). El PCA iterativo con un número fijo de componentes se sobreajusta en cuanto pasa de unos cuantos, mientras que SoftImpute aprovecha muchos más porque apaga los componentes débiles. En una prueba con 652 lectores reales, el puntaje final elevó el acierto entre los 20 libros recomendados de 19.5 % a 24.4 %.

## Datos

**Fuente:** calificaciones de libros de [goodbooks-10k](https://github.com/zygmuntz/goodbooks-10k) (Zając, 2017), obtenidas de Goodreads, y calificaciones de películas de [Letterboxd Movie Ratings Data](https://www.kaggle.com/datasets/samlearner/letterboxd-movie-ratings-data) (Kaggle). Las portadas provienen de Goodreads, Letterboxd, Open Library y TMDB.

**Características:**

| Aspecto | Detalle |
|---|---|
| Libros | 5,976,479 calificaciones de 53,424 lectores sobre 10,000 libros, en escala de 1 a 5. Solo el 1.1 % de la matriz tiene calificación. |
| Películas | 10,503,906 calificaciones de 7,376 usuarios sobre 68,128 películas, en escala de 1 a 10 con medios puntos. El 2.1 % de la matriz tiene calificación, y el catálogo final incluye 28,115 películas. |
| Modelo | 200 componentes por dominio. Los archivos `data/books.json` y `data/movies.json` contienen el catálogo, los géneros, los sesgos de cada título y sus cargas en los componentes. |
| Validación | 10 % de las calificaciones escondidas para comparar el modelo base, el PCA iterativo y SoftImpute. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`01-Recomendacion-PCA.mp4`](01-Recomendacion-PCA.mp4) | Video de presentación del proyecto |
| [`app-v1/index.html`](app-v1/index.html) | Aplicación web, versión 1 |
| [`app-v2/index.html`](app-v2/index.html) | Aplicación web, versión 2, con cuentas y títulos agregados por la comunidad |
| [`app-v2/supabase/supabase_v2.sql`](app-v2/supabase/supabase_v2.sql) | Esquema de la base de datos compartida de la versión 2 |
| `app-v1/data/`, `app-v2/data/` | Modelo entrenado y catálogo de libros y películas (`.json`) |
| [goodbooks-10k](https://github.com/zygmuntz/goodbooks-10k) | Base de datos de calificaciones de libros |
| [Letterboxd Movie Ratings Data (Kaggle)](https://www.kaggle.com/datasets/samlearner/letterboxd-movie-ratings-data) | Base de datos de calificaciones de películas |

Las claves de conexión a Supabase y a la API de TMDB se retiraron de esta copia pública. Sin ellas, la aplicación genera las recomendaciones de forma local, pero no comparte calificaciones ni permite crear cuentas o agregar películas.

## Referencias

- Hastie, T., Mazumder, R., Lee, J. D., & Zadeh, R. (2015). Matrix completion and low-rank SVD via fast alternating least squares. *Journal of Machine Learning Research, 16*(104), 3367–3402.
- James, G., Witten, D., Hastie, T., Tibshirani, R., & Taylor, J. (2023). *An introduction to statistical learning with applications in Python*. Springer. https://doi.org/10.1007/978-3-031-38747-0
- Mazumder, R., Hastie, T., & Tibshirani, R. (2010). Spectral regularization algorithms for learning large incomplete matrices. *Journal of Machine Learning Research, 11*, 2287–2322.
- samlearner. (s. f.). *Letterboxd movie ratings data* [Conjunto de datos]. Kaggle. https://www.kaggle.com/datasets/samlearner/letterboxd-movie-ratings-data
- Zając, Z. (2017). *goodbooks-10k: A new dataset for book recommendations* [Conjunto de datos]. GitHub. https://github.com/zygmuntz/goodbooks-10k
