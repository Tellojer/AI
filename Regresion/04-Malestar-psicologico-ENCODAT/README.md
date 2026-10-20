# Malestar psicológico y consumo de sustancias en México

¿El consumo de alcohol y drogas se asocia con un mayor malestar psicológico en la población mexicana, una vez que se toman en cuenta factores como el sexo, la edad y la escolaridad?

Este proyecto usa la Encuesta Nacional de Consumo de Drogas, Alcohol y Tabaco 2025 (ENCODAT) para estudiar el malestar psicológico, medido con la escala Kessler-10 (K-10). A partir de los reactivos de la encuesta se construyen las variables de consumo de alcohol, edad de inicio del consumo de drogas y exposición a drogas, y se tratan los datos faltantes (imputación por KNN o exclusión, según su origen). Las variables se eligen con una selección *stepwise* mixta mediante pruebas F parciales por bloques. Después se comparan una regresión lineal múltiple y un modelo no lineal de K vecinos más cercanos (KNN), y finalmente el modelo lineal se usa para inferencia, con intervalos de confianza del 95 % para cada asociación.

**Resultado principal:** ambos modelos predicen igual de bien (R² de 0.086 en prueba y error medio de 4.5 puntos), por lo que se elige el lineal por ser interpretable. Todas las asociaciones son significativas: ser mujer, haber tenido dificultades por el consumo de alcohol, haber consumido drogas y haber recibido ofertas de drogas se asocian con mayor malestar, y una mayor escolaridad, con menor malestar. El hallazgo más claro es que no es el consumo de alcohol en sí lo que se asocia con el malestar, sino que ese consumo haya causado problemas. El modelo explica menos del 10 % de la variación, así que sirve para describir tendencias de la población, no para evaluar a una persona. El diseño de la encuesta tampoco permite afirmar causalidad.

## Datos

**Fuente:** [Encuesta Nacional de Consumo de Drogas, Alcohol y Tabaco 2025 (ENCODAT)](https://encuestas.insp.mx/repositorio/encuestas/ENCODAT2025/descargas.php), levantada por la Secretaría de Salud a través de la CONASAMA, el Instituto Nacional de Psiquiatría Ramón de la Fuente Muñiz y el Instituto Nacional de Salud Pública. Es una encuesta probabilística con representatividad nacional y regional. Se usa el cuestionario individual.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 19,200 personas de 12 a 65 años. Después del tratamiento de datos faltantes quedan 18,704 (97.4 %). |
| Variables | 937 en la base completa, de las que se importan 59 para construir 8 variables: sexo, edad, urbanidad, nivel escolar, consumo de alcohol (4 niveles), edad de inicio de drogas (4 niveles), exposición a drogas y el puntaje K-10. |
| Variable de respuesta | Puntaje K-10 de malestar psicológico, de 10 a 50 puntos, con fuerte sesgo a la derecha (37 % de las personas tiene el mínimo). |
| Valores faltantes | Menos del 2.1 % en cualquier variable. El nivel escolar se imputa con KNN y los registros con respuestas inconsistentes de consumo se excluyen. |
| Partición | 80 % entrenamiento (14,963) y 20 % prueba (3,741). |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte.ipynb`](reporte.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte.html`](reporte.html) | El mismo reporte en HTML, sin código |
| [ENCODAT 2025 (descarga oficial)](https://encuestas.insp.mx/repositorio/encuestas/ENCODAT2025/descargas.php) | Base de datos utilizada (cuestionario individual) |