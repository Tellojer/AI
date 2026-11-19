# Mortalidad hospitalaria con ensambles, SVM y redes neuronales

¿Se puede anticipar, con la información del tercer día de hospitalización, qué pacientes gravemente enfermos fallecerán durante su estancia y en qué ventana de tiempo?

En este proyecto se entrenan y comparan cuatro modelos de clasificación para predecir la mortalidad intrahospitalaria de pacientes del estudio SUPPORT: dos métodos de ensamble (Random Forest y Boosting), una máquina de soporte vectorial (SVM) y una red neuronal *feedforward*. Se excluyen las variables que solo se conocen después del desenlace, como la duración de la estancia o los costos, para evitar la fuga de datos, y los valores faltantes se tratan según su origen clínico. Los hiperparámetros se eligen por validación cruzada y los modelos se comparan en un conjunto de prueba con AUC, matrices de confusión y curvas ROC. Como extensión, se predice la ventana temporal del fallecimiento como un problema multiclase y se analiza la relación entre complejidad, desempeño, sobreajuste e interpretabilidad.

**Resultado principal:** los cuatro modelos alcanzan un desempeño alto y estadísticamente equivalente, con AUC en prueba entre 0.866 y 0.872. Lo que los distingue es cómo distribuyen sus errores, ya que la SVM detecta más fallecimientos a cambio de más falsas alarmas y la red neuronal genera menos falsas alarmas a cambio de detectar menos fallecimientos. Los cuatro se apoyan en las mismas variables, sobre todo la gravedad fisiológica (`sps`, `aps`) y el estado neurológico (`scoma`), lo que indica que el límite lo imponen los datos y no el algoritmo. Boosting, el más rápido de entrenar, obtiene el AUC más alto y resulta la opción más conveniente. Predecir la ventana de fallecimiento es mucho más difícil (F1 macro de 0.430 a 0.458).

## Datos

**Fuente:** [SUPPORT2](https://archive.ics.uci.edu/dataset/880/support2) (Harrell, 1995), UCI Machine Learning Repository. Proviene del estudio SUPPORT (*Study to Understand Prognoses and Preferences for Outcomes and Risks of Treatments*), que entre 1989 y 1994 siguió a adultos gravemente enfermos hospitalizados en cinco hospitales universitarios de Estados Unidos (Knaus et al., 1995).

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 9,105 pacientes. |
| Variables | 47, entre demográficas, enfermedad y comorbilidades, escalas clínicas, signos vitales y laboratorios del tercer día, desenlaces y variables posteriores al desenlace, que se excluyen de los predictores. |
| Variable objetivo | `hospdead`, fallecimiento durante la hospitalización (25.9 % de los pacientes). Para la extensión multiclase se construye la ventana temporal de fallecimiento a partir de `death` y `d.time`. |
| Valores faltantes | Presentes en 33 variables, hasta 62 % en algunos laboratorios. Se imputan sin contaminar el conjunto de prueba. |
| Partición | 80 % entrenamiento y 20 % prueba, estratificada por grupo de enfermedad y desenlace. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte3.ipynb`](reporte3.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte3.html`](reporte3.html) | El mismo reporte en HTML, sin código |
| [`03-Mortalidad-ensambles.pdf`](03-Mortalidad-ensambles.pdf) | El mismo reporte en PDF |
| [`support2.csv`](support2.csv) | Base de datos utilizada |

## Referencias

- Christakis, N. A., & Lamont, E. B. (2000). Extent and determinants of error in doctors' prognoses in terminally ill patients: Prospective cohort study. *BMJ, 320*(7233), 469–472. https://doi.org/10.1136/bmj.320.7233.469
- Harrell, F. (1995). *SUPPORT2* [Conjunto de datos]. UCI Machine Learning Repository. https://archive.ics.uci.edu/dataset/880/support2
- Knaus, W. A., Harrell, F. E., Lynn, J., Goldman, L., Phillips, R. S., Connors, A. F., Dawson, N. V., Fulkerson, W. J., Califf, R. M., Desbiens, N., Layde, P., Oye, R. K., Bellamy, P. E., Hakim, R. B., & Wagner, D. P. (1995). The SUPPORT prognostic model: Objective estimates of survival for seriously ill hospitalized adults. *Annals of Internal Medicine, 122*(3), 191–203. https://doi.org/10.7326/0003-4819-122-3-199502010-00007
