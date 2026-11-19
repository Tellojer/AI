# Póster interactivo: ¿subtipos de cáncer de mama o tejido normal en la muestra?

Póster de investigación en formato web que resume el análisis no supervisado de 1,083 tumores de mama de TCGA-BRCA (PCA, K-means y hierarchical clustering). Presenta la pregunta, la metodología, los tres grupos encontrados, su relación con la supervivencia y el posible descubrimiento: la división luminal C2/C3 refleja sobre todo la cantidad de tejido mamario normal incluida en la muestra.

## Interacción

- **Dispersión de PCA** con los 1,083 tumores reales, coloreable por cluster, subtipo PAM50, pureza tumoral o eje de tejido normal. La leyenda permite ocultar categorías y cada punto muestra su detalle al pasar el cursor.
- **Perfil de cada cluster** (C1, C2, C3), que además resalta el grupo en la dispersión.
- **Gráficas con detalle al pasar el cursor**: varianza explicada, riesgo de C1 a lo largo del tiempo, distribución del eje de tejido normal, efecto de cada ajuste por composición y comparación con Netanely et al. (2016).

## Archivos

| Archivo | Contenido |
|---|---|
| [`index.html`](index.html) | El póster completo en un solo archivo, con los datos incluidos |
| [`plantilla.html`](plantilla.html) | El mismo póster sin los datos incrustados |
| [`datos.json`](datos.json) | Coordenadas de PCA, cluster, PAM50, pureza, eje e histología de cada tumor, y varianza explicada |
| [`build.py`](build.py) | Une `plantilla.html` y `datos.json` en `index.html` |

Los datos provienen de la ejecución del reporte del proyecto, [`reporte4.ipynb`](../reporte4.ipynb). Para verlo, descarga `index.html` y ábrelo en el navegador.
