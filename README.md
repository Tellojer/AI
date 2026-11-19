# Inteligencia Artificial

Este repositorio reúne proyectos de inteligencia artificial y aprendizaje automático hechos en Python. Cada proyecto parte de un problema real y un conjunto de datos público, y llega hasta un modelo evaluado y sus conclusiones. Los resultados se presentan como reportes que se pueden leer sin entrar al código, en formato Jupyter Notebook (`.ipynb`), HTML y PDF.

Los proyectos están agrupados por tipo de problema. Cada carpeta tiene su propio README con la descripción del proyecto, el origen y las características de los datos, un índice de sus archivos y sus referencias.

## Índice

### [Regresión](Regresion/)

Modelos que estiman un valor numérico y explican qué variables se asocian con él.

| # | Proyecto | Problema | Modelos |
|---|---|---|---|
| 1 | [Análisis exploratorio del nivel de obesidad](Regresion/01-Obesidad-analisis-exploratorio/) | Describir una población por sus niveles de obesidad y la relación del peso con ellos | Análisis exploratorio y descriptivo |
| 2 | [¿El dinero explica la felicidad de los países?](Regresion/02-Felicidad-regresion-lineal/) | Medir qué tanto explican el PIB y los factores sociales la felicidad de 141 países | Regresión lineal simple y múltiple |
| 3 | [Predicción de calificaciones](Regresion/03-Calificaciones-seleccion-caracteristicas/) | Predecir la calificación final de un estudiante con la menor cantidad de variables | Regresión lineal múltiple con selección *stepwise* |
| 4 | [Malestar psicológico y consumo de sustancias](Regresion/04-Malestar-psicologico-ENCODAT/) | Medir la asociación entre consumo de alcohol y drogas y malestar psicológico en México | Regresión lineal múltiple, KNN e inferencia |

### [Clasificación](Clasificacion/)

Modelos supervisados que asignan a cada caso una categoría o una probabilidad de pertenecer a ella.

| # | Proyecto | Problema | Modelos |
|---|---|---|---|
| 1 | [Riesgo de diabetes con regresión logística](Clasificacion/01-Diabetes-regresion-logistica/) | Identificar a personas con diabetes o prediabetes a partir de sus hábitos y su estado de salud | Regresión logística |
| 2 | [Riesgo de diabetes: LDA vs. árboles de decisión](Clasificacion/02-Diabetes-LDA-arboles/) | Distinguir entre sin diabetes, prediabetes y diabetes | LDA, árbol de decisión |
| 3 | [Mortalidad hospitalaria con ensambles y redes neuronales](Clasificacion/03-Mortalidad-ensambles/) | Anticipar desde el tercer día de hospitalización qué pacientes no sobrevivirán | Random Forest, Boosting, SVM, red neuronal |
| 4 | [Pronóstico de mortalidad: comparación de seis modelos](Clasificacion/04-Pronostico-mortalidad/) | Elegir el mejor modelo para estimar si un paciente morirá y cuándo | Regresión logística, LDA, Random Forest, Boosting, SVM, red neuronal |

### [Aprendizaje no supervisado](No%20supervised%20Learning/)

Modelos que buscan estructura en los datos sin una variable de respuesta: reducción de dimensionalidad y agrupamiento. Incluye además un proyecto de aprendizaje por refuerzo.

| # | Proyecto | Problema | Modelos |
|---|---|---|---|
| 1 | [Off-script: recomendación de películas y libros](No%20supervised%20Learning/01-Recomendacion-PCA/) | Recomendar títulos a partir de 10 calificaciones y de millones de calificaciones de otros usuarios | PCA para *matrix completion* (SoftImpute) y aplicación web |
| 2 | [Tutorial: K-Means y hierarchical clustering](No%20supervised%20Learning/02-Tutorial-KMeans-hierarchical/) | Explicar cómo agrupan ambos métodos y de qué decisiones depende el resultado | K-Means, PCA, hierarchical clustering |
| 3 | [Agente pIAnista](No%20supervised%20Learning/03-Agente-pianista-Q-learning/) | Enseñar a un agente a tocar *Für Elise* por prueba y error | Q-learning tabular |
| 4 | [Cáncer de mama en TCGA-BRCA](No%20supervised%20Learning/04-Cancer-mama-TCGA-BRCA/) | Buscar grupos de tumores en la expresión génica y evaluar su significado biológico y clínico | PCA, K-means, hierarchical clustering, modelos de Cox |

## Herramientas

Python · pandas · NumPy · scikit-learn · TensorFlow/Keras · SciPy · statsmodels · lifelines · Matplotlib · Jupyter · HTML/JavaScript · Supabase

## Cómo navegar

Entra a cualquier proyecto del índice. En su README encontrarás:

- **Reporte HTML:** se abre como página web y es la forma más cómoda de leerlo.
- **Notebook (`.ipynb`):** el reporte con todo su código, para descargarlo y ejecutarlo.
- **PDF:** el mismo reporte en un documento para imprimir o compartir.
- **Base de datos:** el archivo de datos utilizado (`.csv`) o, cuando es demasiado grande para el repositorio, un enlace a su fuente oficial.
- **Referencias:** las fuentes de los datos y la bibliografía principal del proyecto.
