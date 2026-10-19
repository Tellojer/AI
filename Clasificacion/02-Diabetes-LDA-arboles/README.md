# Riesgo de diabetes: LDA vs. árboles de decisión

¿Qué tipo de modelo distingue mejor entre una persona sin diabetes, una con prediabetes y una con diabetes?

En este proyecto se comparan dos enfoques muy distintos para clasificar en estas tres categorías. El primero es el análisis discriminante lineal (LDA), un modelo estadístico que supone que las variables siguen una distribución normal, por lo que se construye solo con las variables que cumplen ese supuesto. El segundo es un árbol de decisión, un modelo basado en reglas cuya complejidad se controla con poda por costo-complejidad elegida mediante validación cruzada.

**Resultado principal:** el árbol podado acierta más en general (exactitud de 83.2 % frente a 65.4 %), pero LDA detecta casi el doble de casos de diabetes (*recall* de 47.8 % frente a 24.7 %). Ninguno de los dos logra reconocer la prediabetes, que representa menos del 2 % de los datos. La elección depende de qué error se considere más costoso: pasar por alto a una persona con diabetes o generar falsas alarmas.

## Datos

**Fuente:** [Diabetes Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset) (Teboul, 2021, Kaggle). El conjunto se obtuvo de la encuesta telefónica anual *Behavioral Risk Factor Surveillance System* (BRFSS) de 2015 de los Centros para el Control y la Prevención de Enfermedades (CDC) de Estados Unidos. Se usa el archivo `diabetes_012_health_indicators_BRFSS2015.csv`.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 253,680 personas. Se trabaja con una muestra aleatoria del 20 % (50,736). |
| Variables predictoras | 21, en su mayoría binarias (presión alta, colesterol alto, tabaquismo, actividad física, etc.), más variables ordinales (salud general, edad, escolaridad, ingreso) y numéricas (IMC, días de mala salud física y mental). |
| Variable objetivo | `Diabetes_012` con tres clases: sin diabetes (84.2 %), prediabetes (1.8 %) y diabetes (13.9 %). |
| Valores faltantes | Ninguno. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte.ipynb`](reporte.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte.html`](reporte.html) | El mismo reporte en HTML, sin código |
| [Diabetes Health Indicators Dataset (Kaggle)](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset) | Base de datos utilizada (archivo `diabetes_012_health_indicators_BRFSS2015.csv`) |