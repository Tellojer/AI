# Pronóstico de mortalidad: comparación de seis modelos de clasificación

¿Qué modelo es el más adecuado para estimar, al tercer día de hospitalización, si un paciente gravemente enfermo fallecerá y en qué ventana de tiempo?

En este proyecto se comparan seis modelos de clasificación para predecir la mortalidad intrahospitalaria de pacientes del estudio SUPPORT: dos clasificadores lineales (regresión logística y análisis discriminante lineal), dos ensambles (Random Forest y Boosting), una máquina de soporte vectorial y una red neuronal. Los modelos se comparan en validación cruzada repetida por su desempeño, su estabilidad entre particiones, su costo computacional y su interpretabilidad, con un estadístico F y pruebas t pareadas corregidas. El modelo seleccionado se evalúa en un conjunto de prueba independiente con intervalos de confianza por *bootstrap*. Después se predice la ventana temporal del fallecimiento (30, 180 y 365 días) con modelos multiclase, y a 6 meses el modelo se compara con el modelo pronóstico SUPPORT y con la estimación del médico tratante.

**Resultado principal:** la regresión logística resulta el modelo más adecuado. Obtiene el mayor AUC promedio, estadísticamente equivalente al de Random Forest, Boosting y LDA y superior al de la SVM y la red neuronal, con la menor variabilidad, el menor sobreajuste y el menor costo, y es el único cuyas predicciones se explican en términos clínicos mediante razones de momios. En pacientes nuevos alcanza un AUC de 0.872 y detecta a casi 8 de cada 10 fallecimientos. Los modelos distinguen bien la muerte en el primer mes y la supervivencia mayor a un año, pero no las ventanas intermedias. A 6 meses, el modelo discrimina tan bien como el médico tratante y mejor que el modelo SUPPORT.

## Datos

**Fuente:** [SUPPORT2](https://archive.ics.uci.edu/dataset/880/support2) (Harrell, 1995), UCI Machine Learning Repository. Proviene del estudio SUPPORT (*Study to Understand Prognoses and Preferences for Outcomes and Risks of Treatments*), que entre 1989 y 1994 siguió a adultos gravemente enfermos hospitalizados en cinco hospitales universitarios de Estados Unidos (Knaus et al., 1995).

**Características:**

| Aspecto | Detalle |
|---|---|
| Registros | 9,105 pacientes. |
| Variables | 47, entre demográficas, enfermedad y comorbilidades, escalas clínicas, signos vitales y laboratorios del tercer día, desenlaces y variables posteriores al desenlace, que se excluyen de los predictores. |
| Variable objetivo | `hospdead`, fallecimiento durante la hospitalización (25.9 % de los pacientes). Para la extensión multiclase se construye la ventana temporal de fallecimiento a partir de `death` y `d.time`. |
| Valores faltantes | Presentes en 33 variables, hasta 62 % en algunos laboratorios. Se imputan sin contaminar el conjunto de prueba. |
| Partición | 80 % entrenamiento y 20 % prueba (1,821 pacientes), estratificada por grupo de enfermedad y desenlace. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte4.ipynb`](reporte4.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte4.html`](reporte4.html) | El mismo reporte en HTML, sin código |
| [`04-Pronostico-mortalidad.pdf`](04-Pronostico-mortalidad.pdf) | El mismo reporte en PDF |
| [`support2.csv`](support2.csv) | Base de datos utilizada |

## Referencias

- Bouckaert, R. R., & Frank, E. (2004). Evaluating the replicability of significance tests for comparing learning algorithms. En H. Dai, R. Srikant, & C. Zhang (Eds.), *Advances in knowledge discovery and data mining* (pp. 3–12). Springer. https://doi.org/10.1007/978-3-540-24775-3_3
- Christakis, N. A., & Lamont, E. B. (2000). Extent and determinants of error in doctors' prognoses in terminally ill patients: Prospective cohort study. *BMJ, 320*(7233), 469–472. https://doi.org/10.1136/bmj.320.7233.469
- Harrell, F. (1995). *SUPPORT2* [Conjunto de datos]. UCI Machine Learning Repository. https://archive.ics.uci.edu/dataset/880/support2
- Knaus, W. A., Harrell, F. E., Lynn, J., Goldman, L., Phillips, R. S., Connors, A. F., Dawson, N. V., Fulkerson, W. J., Califf, R. M., Desbiens, N., Layde, P., Oye, R. K., Bellamy, P. E., Hakim, R. B., & Wagner, D. P. (1995). The SUPPORT prognostic model: Objective estimates of survival for seriously ill hospitalized adults. *Annals of Internal Medicine, 122*(3), 191–203. https://doi.org/10.7326/0003-4819-122-3-199502010-00007
- Nadeau, C., & Bengio, Y. (2003). Inference for the generalization error. *Machine Learning, 52*(3), 239–281. https://doi.org/10.1023/A:1024068626366
- Peduzzi, P., Concato, J., Kemper, E., Holford, T. R., & Feinstein, A. R. (1996). A simulation study of the number of events per variable in logistic regression analysis. *Journal of Clinical Epidemiology, 49*(12), 1373–1379. https://doi.org/10.1016/S0895-4356(96)00236-3
