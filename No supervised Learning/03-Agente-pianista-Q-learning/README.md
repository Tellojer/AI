# Agente pIAnista: Q-learning para tocar *Für Elise*

¿Puede un agente aprender a tocar una melodía en el piano solo por prueba y error, sin conocer la partitura ni la digitación?

En este proyecto se construye un ambiente propio, un teclado con una mano de 5 dedos, y se entrena un agente de Q-learning tabular para que toque el inicio de *Für Elise* (Beethoven). En cada paso el agente decide si mover la mano, qué dedo usar y cuándo presionar, y recibe castigos cuando una nota suena mal, llega tarde o se deja pasar. Antes de entrenar el agente final se comparan tres configuraciones (tipo de recompensa y tasa de aprendizaje) en 10 semillas, con pruebas t pareadas y corrección de Holm, y se toma como línea base un agente aleatorio. El aprendizaje se documenta con curvas de desempeño, la digitación aprendida y un historial en video con audio. Por último, la configuración elegida se aplica sin cambios al Himno a la Alegría.

**Resultado principal:** el agente aprendió a tocar las 35 notas del inicio de *Für Elise* a tiempo y sin errores en alrededor de 2,000 episodios, partiendo de un desempeño aleatorio de 1 nota a tiempo. El *early stopping* detuvo el entrenamiento en el episodio 3,300 sin perder desempeño. El hallazgo más importante fue el diseño de recompensas: con recompensas positivas el agente se conforma con tocar algunas notas tarde, mientras que con castigos y la tabla Q en ceros explora de forma sistemática y alcanza la ejecución perfecta en todas las semillas, una diferencia significativa aun después de corregir por comparaciones múltiples. El Himno a la Alegría se aprendió unas 5 veces más rápido (episodio 1,400), porque es más corto y cabe en una sola posición de la mano.

## Datos

**Fuente:** no se usa una base de datos externa. El ambiente se programa desde cero y cada melodía se define como una lista de notas con su número MIDI y su duración en dieciseisavos.

**Características:**

| Aspecto | Detalle |
|---|---|
| Melodías | Inicio de *Für Elise* (35 notas) e Himno a la Alegría. |
| Ambiente | Teclado de Do4 a Mi5 (10 teclas blancas) y una mano de 5 dedos con 6 posiciones posibles. El tiempo avanza en *ticks* (2 por dieciseisavo). |
| Estado | Posición de la mano, nota que toca y fase (ticks que faltan o han pasado para el momento de la nota). La tabla Q tiene 6 × 35 × 10 estados y 15 acciones (31,500 valores). |
| Acciones | 15: mover la mano 1 o 3 teclas a cada lado, tocar con cualquiera de los 5 dedos su tecla blanca o la tecla negra de arriba, o esperar. |
| Recompensas | 0 por nota a tiempo y castigos por nota tardía (−3), equivocada (hasta −5), perdida (−10), mover la mano (−0.5) o acciones sin efecto. |
| Configuración final | Castigos con α = 0.5, γ = 0.99 y ε de 1 a 0.01 con decaimiento de 0.9995, elegida entre tres configuraciones comparadas en 10 semillas. |

## Archivos

| Archivo | Contenido |
|---|---|
| [`reporte3.ipynb`](reporte3.ipynb) | Reporte completo con código, tablas y figuras |
| [`reporte3.html`](reporte3.html) | El mismo reporte en HTML, sin código |
| [`03-Agente-pianista-Q-learning.pdf`](03-Agente-pianista-Q-learning.pdf) | El mismo reporte en PDF |
| [`03-Agente-pianista-Q-learning.mp4`](03-Agente-pianista-Q-learning.mp4) | Video de presentación del proyecto |
| [`historial-aprendizaje.mp4`](historial-aprendizaje.mp4) | Historial del aprendizaje del agente en video, con audio, generado por el reporte |

## Referencias

- James, G., Witten, D., Hastie, T., Tibshirani, R., & Taylor, J. (2023). *An introduction to statistical learning with applications in Python*. Springer. https://doi.org/10.1007/978-3-031-38747-0
- Sutton, R. S., & Barto, A. G. (2018). *Reinforcement learning: An introduction* (2.ª ed.). MIT Press.
