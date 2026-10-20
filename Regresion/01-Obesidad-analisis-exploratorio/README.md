# Análisis exploratorio del nivel de obesidad en Latinoamérica

¿Qué características tiene una población estudiada por sus niveles de obesidad, y cómo se relaciona el peso con esos niveles?

Este proyecto es el punto de partida de un estudio estadístico sobre obesidad. Se revisan la estructura y la calidad de los datos, se clasifican sus variables y se describe la población. Después se propone una variable que haría falta para mejorar el estudio (el número diario de pasos, como medida del sedentarismo), se elige el nivel de obesidad como variable de respuesta para un análisis de inferencia y se explora, en la subpoblación masculina, cómo se distribuye el peso en cada nivel.

**Resultado principal:** los datos están completos y el nivel de obesidad está bien balanceado entre sus siete categorías (del 12.9 % al 16.6 % cada una), lo que lo hace una buena variable de respuesta. En los hombres, el peso aumenta de forma constante con cada nivel, de una mediana de unos 55 kg en peso insuficiente a más de 117 kg en obesidad tipo II. La obesidad tipo III aparece casi exclusivamente en mujeres.

## Datos

**Fuente:** [Estimation of obesity levels based on eating habits and physical condition](https://archive.ics.uci.edu/dataset/544/estimation+of+obesity+levels+based+on+eating+habits+and+physical+condition) (Palechor y De la Hoz Manotas, 2019), UCI Machine Learning Repository. Los datos fueron recopilados por la Universidad de la Costa (Colombia) con personas de México, Perú y Colombia. Se usa una versión con 10 de sus variables, con nombres en español.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 2,111 personas de entre 14 y 61 años (50.6 % hombres, 49.4 % mujeres). |
| Variables | 10: sexo, edad, estatura, peso, antecedentes familiares de sobrepeso, consumo frecuente de alimentos calóricos, consumo de vegetales, tabaquismo, consumo de agua y nivel de obesidad. |
| Variable de respuesta | `NivelDeObesidad`, ordinal con 7 categorías definidas por el índice de masa corporal, de peso insuficiente a obesidad tipo III. |
| Valores faltantes | Ninguno. |
| Observación | Parte de los registros fue generada sintéticamente por los autores para balancear las categorías, por lo que algunas variables de escala 1–3 tienen valores decimales. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte.ipynb`](reporte.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte.html`](reporte.html) | El mismo reporte en HTML, sin código |
| [`obesidad.csv`](obesidad.csv) | Base de datos utilizada |