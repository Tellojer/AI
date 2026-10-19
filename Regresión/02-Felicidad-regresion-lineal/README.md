# Regresión lineal: ¿el dinero explica la felicidad de los países?

¿Qué tanto depende la felicidad promedio de un país de su economía, y qué otros factores la explican mejor?

En este proyecto se modela el índice de felicidad de 141 países. Primero se usa una regresión lineal simple con el producto interno bruto (PIB) como única variable, en su escala original y en escala logarítmica. Después se amplían los datos con tres variables del World Happiness Report 2022 (apoyo social, esperanza de vida saludable y percepción de corrupción) y se construye una regresión lineal múltiple. Se comparan ambos modelos, se calcula el estadístico F para probar la significancia global y se usan coeficientes estandarizados para ver qué variable pesa más.

**Resultado principal:** el PIB por sí solo explica apenas el 22 % de la variación de la felicidad, y solo en escala logarítmica, porque su efecto se va agotando conforme el país es más rico. Al agregar las variables sociales, el modelo explica el 73 % (F = 92.5, p < 0.001). El apoyo social resulta el factor más importante, seguido de la esperanza de vida, mientras que el PIB deja de ser significativo.

## Datos

**Fuente:** base con el índice de felicidad de 2022 y el PIB de 2020 de cada país, ampliada con las variables del [World Happiness Report 2022](https://worldhappiness.report/ed/2022/) (Helliwell et al., 2022). Las tablas se unieron por el nombre del país.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 141 países. |
| Variables originales | País, índice de felicidad (escala 0–10, de 2.40 a 7.82) y PIB total en dólares (de 1.2 × 10⁹ a 2.1 × 10¹³). |
| Variables agregadas | Apoyo social, esperanza de vida saludable y percepción de corrupción, tal como las reporta el World Happiness Report 2022. |
| Variable de respuesta | Índice de felicidad. |
| Valores faltantes | Cinco países sin datos en el World Happiness Report se excluyen del modelo múltiple. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte.ipynb`](reporte.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte.html`](reporte.html) | El mismo reporte en HTML, sin código |
| [`felicidad.csv`](felicidad.csv) | Base de datos utilizada |
| [World Happiness Report 2022](https://worldhappiness.report/ed/2022/) | Fuente de las variables agregadas |