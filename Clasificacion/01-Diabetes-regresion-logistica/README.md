# Riesgo de diabetes con regresión logística

¿Se puede identificar a una persona con diabetes o prediabetes solo con información de sus hábitos, su estado de salud y su situación socioeconómica?

En este proyecto se construye un modelo de regresión logística que estima la probabilidad de que una persona tenga diabetes o prediabetes (clase positiva) o no la tenga (clase negativa). Se usa validación cruzada estratificada de 5 *folds* para elegir el modelo y un conjunto de prueba independiente para evaluarlo. También se analiza cómo cambia el desempeño con distintos umbrales de decisión y qué variables pesan más en la predicción.

**Resultado principal:** el modelo alcanza un AUC de 0.820 en prueba. Los predictores más fuertes son la salud general autopercibida, el índice de masa corporal, la edad, la presión arterial alta y el colesterol alto. Como solo el 16 % de los casos son positivos, el umbral estándar de 0.5 detecta pocos casos, y bajar el umbral mejora mucho la sensibilidad.

## Datos

**Fuente:** [Diabetes Health Indicators Dataset](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset) (Teboul, 2021, Kaggle). El conjunto se obtuvo de la encuesta telefónica anual *Behavioral Risk Factor Surveillance System* (BRFSS) de 2015 de los Centros para el Control y la Prevención de Enfermedades (CDC) de Estados Unidos. Se usa el archivo `diabetes_012_health_indicators_BRFSS2015.csv`.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 253,680 personas. Se trabaja con una muestra aleatoria del 10 % (25,368). |
| Variables predictoras | 21, en su mayoría binarias (presión alta, colesterol alto, tabaquismo, actividad física, consumo de frutas y verduras, etc.), más variables ordinales (salud general, edad, escolaridad, ingreso) y numéricas (IMC, días de mala salud física y mental). |
| Variable objetivo | `Diabetes_012`: sin diabetes (84.2 %), prediabetes (1.8 %) y diabetes (13.9 %). En este proyecto, prediabetes y diabetes se agrupan como clase positiva (15.6 %). |
| Valores faltantes | Ninguno. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte1.ipynb`](reporte1.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte1.html`](reporte1.html) | El mismo reporte en HTML, sin código |
| [`01-Diabetes-regresion-logistica.pdf`](01-Diabetes-regresion-logistica.pdf) | El mismo reporte en PDF |
| [Diabetes Health Indicators Dataset (Kaggle)](https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset) | Base de datos utilizada (archivo `diabetes_012_health_indicators_BRFSS2015.csv`) |

## Referencias

- National Institute of Diabetes and Digestive and Kidney Diseases. (s. f.). *Síntomas y causas de la diabetes*. https://www.niddk.nih.gov/health-information/informacion-de-la-salud/diabetes/informacion-general/sintomas-causas
- Teboul, A. (2021). *Diabetes health indicators dataset* [Conjunto de datos]. Kaggle. https://www.kaggle.com/datasets/alexteboul/diabetes-health-indicators-dataset
- World Health Organization. (2024, 14 de noviembre). *Diabetes*. https://www.who.int/es/news-room/fact-sheets/detail/diabetes
