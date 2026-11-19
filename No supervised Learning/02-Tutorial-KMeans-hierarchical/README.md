# Tutorial: K-Means y hierarchical clustering

¿Cómo encuentran grupos los algoritmos de clustering cuando los datos no tienen etiquetas, y de qué decisiones depende el resultado?

Este proyecto es un tutorial de los dos métodos de clustering más usados. En la primera parte se construye K-Means desde cero con datos sintéticos: asignación aleatoria inicial, cálculo de centroides, reasignación e iteración hasta converger, junto con la teoría de la variación dentro de los grupos y del óptimo local. En la segunda se aplica K-Means con scikit-learn a datos reales de expresión génica, primero sobre todas las variables y después sobre los componentes principales (PCA), y se interpretan los clusters con las etiquetas del tipo de cáncer. En la tercera se construyen dendrogramas de hierarchical clustering y se comparan métricas de disimilitud (euclidiana y correlación) y métodos de linkage (*complete* y *average*). La última parte compara ambos métodos y discute cuándo conviene usar cada uno.

**Resultado principal:** K-Means encuentra un óptimo local que depende de la asignación inicial; en los datos sintéticos, una de seis inicializaciones terminó en una solución mucho peor, por lo que el algoritmo se corre varias veces (`n_init`). En NCI60, con 6,830 variables, el preprocesamiento con PCA resume los datos en 7 componentes donde los grupos sí se distinguen. Las líneas celulares de leucemia, melanoma y colon quedan prácticamente completas en un mismo cluster con cualquier método, mientras que las de mama quedan repartidas. El hierarchical clustering no requiere fijar el número de clusters, pero su resultado depende de la métrica y del linkage (*complete* produjo ramas más balanceadas que *average*).

## Datos

**Fuente:** conjunto NCI60 del paquete [`ISLP`](https://pypi.org/project/ISLP/), que acompaña al libro *An Introduction to Statistical Learning with Applications in Python* (James et al., 2023). Contiene mediciones de expresión génica de líneas celulares de cáncer del Instituto Nacional del Cáncer de Estados Unidos. La primera parte usa además un conjunto sintético generado con `make_blobs` de scikit-learn.

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 64 líneas celulares de cáncer. |
| Variables | 6,830 genes, con muchas más variables que observaciones. |
| Etiquetas | 14 tipos de cáncer muy desbalanceados (de 1 a 9 líneas celulares cada uno). No se usan para agrupar, solo para interpretar los clusters. |
| Valores faltantes | Ninguno. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte2.ipynb`](reporte2.ipynb) | Tutorial completo con código, tablas y figuras |
| [`reporte2.html`](reporte2.html) | El mismo tutorial en HTML, sin código |
| [`02-Tutorial-KMeans-hierarchical.pdf`](02-Tutorial-KMeans-hierarchical.pdf) | El mismo tutorial en PDF |
| [`ISLP` (PyPI)](https://pypi.org/project/ISLP/) | Paquete que contiene la base de datos NCI60 |

## Referencias

- James, G., Witten, D., Hastie, T., Tibshirani, R., & Taylor, J. (2023). *An introduction to statistical learning with applications in Python*. Springer. https://doi.org/10.1007/978-3-031-38747-0
- Martínez Torteya, A. (2026a). *C3.3 K-Means clustering* [Diapositivas de PowerPoint]. Universidad de Monterrey.
- Martínez Torteya, A. (2026b). *C3.4 Hierarchical clustering* [Diapositivas de PowerPoint]. Universidad de Monterrey.
