---
title: "Generación de diversos gráficos usando ggplot2"
date: 2024-03-22
draft: false
description: "Generación de diversos gráficos usando ggplot2 "
tags: ["viernes", "plots"]
showAuthor: false
authors:
 - "sofia"
series: ["Viernes2024"]
series_order: 8
seriesOpened: true
---

## ¿Qué es ggplot?

-   Una biblioteca de visualizacion de datos para el lenguaje de programacion R.
-   Permite a los usuarios construir gráficos complejos a parhttps://eveliacoss.github.io/ViernesBioinfo2024/Clase_ggplot/slides.html#1tir de componentes simples y entendibles.
-   Ofrece amplias opciones para personalizar gráficos, incluyendo temas, leyendas y títulos.

## Anatomia de las graficas de ggplot

![Main Components of the grammar of graphics](https://eveliacoss.github.io/ViernesBioinfo2024/Clase_ggplot/imagenes/anatomia.jpeg)

-   **Datos**: ggplot2 trabaja directamente con data frames en R, haciendo fácil la integración con otras herramientas de análisis de datos.

-   **Aes (Estéticas)**: Define cómo se mapean las variables de los datos a propiedades visuales como el color, forma y tamaño.

-   **Geoms (Objetos Geométricos)**: Representan tipos de gráficos como puntos, líneas, barras, etc. Permiten construir una amplia gama de visualizaciones.

-   **Facets**: permiten generar gráficos para múltiples subconjuntos de un conjunto de datos utilizando la misma escala y ejes, todo en una sola imagen

-   **Stats**: son funciones que resumen o transforman los datos de formas que facilitan su visualización

## De un dataframe a una grafica

![Source: R for ecology](https://eveliacoss.github.io/ViernesBioinfo2024/Clase_ggplot/imagenes/ggplot2_simplified.png)

La imagen simplifica muy bien lo que es ggplot y `la accion de transormar nuestros datos a una grafica`.

La tabla es el argumento principal cuando vamos a hacer una grafica de `ggplot` y con los esteticos vamos a mapear cada una de las variables a las `propiedades visuales` de nuestra grafica y despues se agrega la geometria que en este caso fue asignarle un color a la variable dieta.

## Ideas de visualizaciones

Quizas tengas un conjunto de datos que no sepas representar visualmente, estas dos herramientas son muy utiles para inspirarse y tener una idea de como representar tus datos.

Esta en general es para hacer analisis de datos, etc. : - [The data visualization](https://datavizcatalogue.com/#google_vignette)

Esta es especificamente enfocada en hacer la manipulacion de los datos con `tidyverse` y las graficas con `ggplot`. - [The R graph gallery](https://r-graph-gallery.com/)

## Script de la clase de hoy

{{< button href="RMDWN/script.html" target="_self" >}}
Script
{{< /button >}}
