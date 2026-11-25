---
title: "Programación defensiva con ggplot2"
date: 2024-11-01
draft: false
description: "Escribe funciones en R que se defienden de errores y úsalas para crear gráficas con ggplot2: buenas prácticas, estructuras de control, stop(), warning(), assertthat y las capas de ggplot2."
summary: "Funciones en R a prueba de errores y gráficas con ggplot2."
tags: ["R", "ggplot2", "funciones", "tutorial"]
showAuthor: false
authors:
  - "evelia"
series: ["R"]
series_order: 3
---

En esta guía rápida aprenderás a escribir funciones para repetir varias operaciones con un solo comando, a protegerlas de entradas inesperadas (**programación defensiva**) y a usarlas para crear gráficas con **ggplot2**.

- **Instructora:** Evelia Coss
- **Duración:** 3 horas
- **Origen:** se impartió en los [VieRnes de Bioinformática, Parte 2](/playlist/2/) (Viernes 9, 1 de noviembre de 2024; presentación de proyectos el 6 de diciembre de 2024)

## Lo que vas a aprender

1. **[Buenas prácticas en bioinformática](https://eveliacoss.github.io/Defensiva_ggplot2024/Parte1.html):** de un algoritmo a un buen software, documentación y puntos clave para trabajar en bioinformática.
2. **[El ABC de las funciones](https://eveliacoss.github.io/Defensiva_ggplot2024/Parte2.html):** consejos para escribir funciones y estructuras de control (`if`/`else`, `for`, `while`, `break`/`next` y `case_when()`), con una actividad grupal con datos de *gapminder*.
3. **[Programación defensiva](https://eveliacoss.github.io/Defensiva_ggplot2024/Parte3.html):** `stop()`, `warning()` y `message()` dentro de `if()`, y el paquete `assertthat`.
4. **[ggplot2](https://eveliacoss.github.io/Defensiva_ggplot2024/Parte4.html):** desglose de las capas comunes de una gráfica.
5. **[Proyecto final](https://eveliacoss.github.io/Defensiva_ggplot2024/Parte5.html):** un reporte que integra funciones defensivas y visualizaciones.

## Grabación de la clase

{{< presentacion url="https://drive.google.com/file/d/1LyO96Wv5eUBC-NMXUVGQ9y2DiXXN_SuT/view" titulo="Grabación: Programación defensiva con ggplot2" embed="https://drive.google.com/file/d/1LyO96Wv5eUBC-NMXUVGQ9y2DiXXN_SuT/preview" >}}

## Proyectos de quienes tomaron la clase

- Julieth López: [proyecto en Quarto](https://juliethlopez.github.io/Proyecto_ViernesBioinformatica_2024/) con datos de las Grandes Ligas de béisbol
- Erick Arroyo y Adriana Chacón: [proyecto](https://github.com/Capnemo1/ProyectoVDB) con datos de Star Wars
- Erika Cruz y Amairani Cancino: [proyecto](https://github.com/ErikaCruzB/UrbanSquirrels) con datos de ardillas urbanas

## Material

<a class="presentacion-material" href="https://eveliacoss.github.io/Defensiva_ggplot2024/" target="_blank" rel="noopener">↗ Abrir el tutorial completo</a>

{{< github repo="EveliaCoss/Defensiva_ggplot2024" >}}

El material se puede reutilizar citando la fuente, bajo la licencia [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).
