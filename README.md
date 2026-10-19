[README.md](https://github.com/user-attachments/files/33689193/README.md)
# Inteligencia Artificial

Este repositorio reúne proyectos de inteligencia artificial y aprendizaje automático hechos en Python. Cada proyecto parte de un problema real y un conjunto de datos público, y llega hasta un modelo evaluado y sus conclusiones. Los resultados se presentan como reportes que se pueden leer sin entrar al código, en formato Jupyter Notebook (`.ipynb`) y en HTML.

Los proyectos están agrupados por tipo de problema. Cada carpeta tiene su propio README con la descripción del proyecto, el origen y las características de los datos y un índice de sus archivos.

## Índice

### [Clasificación](Clasificacion/)

Modelos supervisados que asignan a cada caso una categoría o una probabilidad de pertenecer a ella.

| # | Proyecto | Problema | Modelos |
|---|---|---|---|
| 1 | [Riesgo de diabetes con regresión logística](Clasificación/01-Diabetes-regresion-logistica/) | Identificar a personas con diabetes o prediabetes a partir de sus hábitos y su estado de salud | Regresión logística |
| 2 | [Riesgo de diabetes: LDA vs. árboles de decisión](Clasificacion/02-Diabetes-LDA-arboles/) | Distinguir entre sin diabetes, prediabetes y diabetes | LDA, árbol de decisión |
| 3 | [Mortalidad hospitalaria con ensambles y redes neuronales](Clasificacion/03-Mortalidad-ensambles/) | Anticipar desde el tercer día de hospitalización qué pacientes no sobrevivirán | Random Forest, Boosting, SVM, red neuronal |
| 4 | [Pronóstico de mortalidad y tablero interactivo](Clasificacion/04-Pronostico-mortalidad/) | Elegir el mejor modelo para estimar si un paciente morirá y cuándo | Seis modelos comparados y un tablero web |

## Herramientas

Python · pandas · NumPy · scikit-learn · TensorFlow/Keras · SciPy · Matplotlib · Jupyter · HTML/JavaScript

## Cómo navegar

Entra a cualquier proyecto del índice. En su README encontrarás:

- **Reporte HTML:** se abre como página web y es la forma más cómoda de leerlo.
- **Notebook (`.ipynb`):** el reporte con todo su código, para descargarlo y ejecutarlo.
- **Base de datos (`.csv`):** el archivo de datos utilizado, también para descargar.
