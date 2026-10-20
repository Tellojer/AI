# Predicción de calificaciones: limpieza de datos y selección de características

¿Se puede predecir la calificación final de un estudiante, y cuáles de sus datos son realmente necesarios para hacerlo?

Este proyecto se centra en preparar bien los datos antes de modelar. Se eliminan registros duplicados, se codifican las variables categóricas y ordinales con variables *dummy*, se revisan los valores atípicos con el rango intercuartílico y se aplica una transformación logarítmica a las faltas, muy sesgadas. Luego se mide la colinealidad entre variables con el factor de inflación de la varianza (VIF) y se eligen los predictores con una selección *stepwise* mixta, hecha solo con los datos de entrenamiento para evitar fuga de información. Por último, se entrena una regresión lineal múltiple y se evalúa en datos de prueba.

**Resultado principal:** de 13 variables candidatas, el modelo solo necesita 4: las dos calificaciones parciales, las faltas y las materias reprobadas. Explica el 85 % de la variación de la calificación final en entrenamiento y el 83 % en prueba, con un error medio de alrededor de 1.3 puntos en una escala de 0 a 20. Los datos demográficos y de contexto (escuela, sexo, edad, acceso a internet, horas de estudio) no aportan información adicional. La principal limitación es que el modelo no anticipa a los alumnos con calificación final de 0, que probablemente no presentaron el examen.

## Datos

**Fuente:** [Student Performance](https://archive.ics.uci.edu/dataset/320/student+performance) (Cortez y Silva, 2008), UCI Machine Learning Repository. Datos de estudiantes de secundaria de dos escuelas de Portugal (Gabriel Pereira y Mousinho da Silveira). Se usa una versión con 10 de sus variables, con nombres en español.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 395 estudiantes (392 después de eliminar 3 duplicados). |
| Variables | 10: escuela, sexo, edad, horas de estudio, materias reprobadas, acceso a internet, faltas y las calificaciones G1, G2 y G3. |
| Variable de respuesta | `G3`, calificación final en escala de 0 a 20. |
| Valores faltantes | Ninguno. |
| Partición | 80 % entrenamiento y 20 % prueba. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte.ipynb`](reporte.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte.html`](reporte.html) | El mismo reporte en HTML, sin código |
| [`calificaciones.csv`](calificaciones.csv) | Base de datos utilizada |