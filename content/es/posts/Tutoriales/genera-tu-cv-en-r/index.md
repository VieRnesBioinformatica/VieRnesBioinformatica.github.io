---
title: "Genera tu CV en R"
date: 2023-12-04
draft: false
description: "Crea tu curriculum vitae en HTML y PDF desde R con datadrivencv y pagedown, usando una hoja de Google como base de datos."
summary: "Tu CV en HTML y PDF desde R, con datadrivencv, pagedown y una hoja de Google."
tags: ["R", "R Markdown", "CV", "tutorial"]
showAuthor: false
authors:
  - "evelia"
series: ["R"]
series_order: 13
---

En este tutorial vas a crear tu **curriculum vitae en HTML y PDF directamente desde R**. Tu información vive en una hoja de Google y el paquete [datadrivencv](https://nickstrayer.me/datadrivencv/) la convierte en un CV con buen diseño. Así, para actualizarlo solo editas la hoja y vuelves a generar el documento.

- **Autora:** Evelia Coss
- **Origen:** taller de R-Ladies, 4 de diciembre de 2023
- **Nivel:** básico (necesitas R y RStudio instalados)

## Video explicativo

{{< presentacion url="https://youtu.be/UpQ1PDt49qU" titulo="Genera tu CV en R (video)" embed="https://www.youtube.com/embed/UpQ1PDt49qU" >}}

## Lo que vas a necesitar

| Paquete | Para qué sirve |
|---|---|
| [rmarkdown](https://rmarkdown.rstudio.com/articles_intro.html) | Escribir el documento del CV |
| [pagedown](https://github.com/rstudio/pagedown) | Convertir el HTML en PDF |
| [devtools](https://www.r-project.org/nosvn/pandoc/devtools.html) | Instalar paquetes desde GitHub |
| [datadrivencv](https://nickstrayer.me/datadrivencv/) | Generar el CV a partir de tus datos |
| [fontawesome](https://github.com/rstudio/fontawesome) | Íconos de cada sección |

```r
install.packages("rmarkdown")
remotes::install_github("rstudio/pagedown")
install.packages("devtools")
devtools::install_github("nstrayer/datadrivencv")
```

## Paso 1. Crea tu hoja de Google con tus datos

Tu información se guarda en una hoja de cálculo de Google con cuatro pestañas:

- 🌟 **entries:** toda tu trayectoria: formación (*education*), estancias y prácticas (*research_positions*), experiencia en la industria (*industry_positions*), docencia, publicaciones, etc.
- 💋 **language_skills:** los lenguajes de programación que manejas.
- 😎 **text_blocks:** un breve resumen sobre ti y tu trayectoria.
- 💅 **contact_info:** cómo te pueden contactar y tus redes sociales.

Para empezar, haz una copia (*Archivo → Hacer una copia*) de alguno de estos ejemplos:

- [Ejemplo de Nick Strayer](https://docs.google.com/spreadsheets/d/14MQICF2F8-vf8CKPF1m4lyGKO6_thG-4aSwat1e2TWc/edit#gid=917338460), el creador del paquete.
- [Ejemplo de Mónica Padilla](https://docs.google.com/spreadsheets/d/1gy4_VaGXhYMi8TwakQGk80dWoYfrSY3Wkl4BqVxECNY/edit#gid=917338460), que además agrega una pestaña de lenguajes de programación.
- [Ejemplo de Evelia Coss](https://docs.google.com/spreadsheets/d/1JckGt60BNWheMo23d6bloYLq27h2t5X7hGAXsj0Mlwo/edit?usp=sharing)

{{< alert icon="lightbulb" >}}
**Dos detalles importantes:** no uses acentos ni símbolos raros en el archivo, y **comparte la hoja con permiso de edición** antes de copiar su enlace.
{{< /alert >}}

## Paso 2. Prepara tu archivo `CV.Rmd`

Descarga como base el archivo que te resulte más claro:

- [cv.Rmd de Nick Strayer](https://github.com/nstrayer/cv/blob/master/cv.Rmd)
- [cv.rmd de Mónica Padilla](https://github.com/mpadilla905/mpadilla905.github.io/blob/master/cv.rmd)
- [index.Rmd de Leonardo Collado](https://github.com/lcolladotor/cv/blob/gh-pages/index.Rmd)
- [cv_ECoss.rmd de Evelia Coss](https://github.com/EveliaCoss/Make_yourCV/blob/main/cv_ECoss.rmd)

Ábrelo en RStudio. En el primer bloque de código cambia `data_location` por **el enlace de tu hoja de Google**:

```r
knitr::opts_chunk$set(results = "asis", echo = FALSE)

library(magrittr)                       # para el pipe %<>%
source("cv_printing_functions.r")       # funciones que imprimen cada sección

CV <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/TU_HOJA/edit?usp=sharing",
  pdf_mode = params$pdf_mode
)
```

El archivo [`cv_printing_functions.r`](https://github.com/EveliaCoss/Make_yourCV/blob/main/cv_printing_functions.r) debe estar **en la misma carpeta** que tu `CV.Rmd`.

En la sección *Disclaimer* pon el enlace a tu GitHub y da crédito a los creadores:

```markdown
The source code is available at [TU_USUARIO/CV](https://github.com/TU_USUARIO/CV)
and is powered by [nstrayer/cv](https://github.com/nstrayer/cv).
```

### Agregar una sección nueva

Para agregar, por ejemplo, **"Divulgación científica"**:

1. En la pestaña *entries* de tu hoja, usa una sección nueva, por ejemplo `science_communication`.
2. En tu `CV.Rmd`, agrega el título con un ícono de [Font Awesome](https://fontawesome.com/v5/search) (`data-icon`) y un bloque que la imprima:

````markdown
Science Communication {data-icon=atom}
--------------------------------------------------------------------------------

```{r}
CV %<>% print_section('science_communication')
```
````

## Paso 3. Genera tu CV en HTML y PDF

Con tu hoja de Google, `cv_printing_functions.r` y tu `CV.Rmd` en la misma carpeta, corre este script (es una versión corregida de [render_cv.R](https://github.com/EveliaCoss/Make_yourCV/blob/main/render_cv.R)):

```r
library(tidyverse)
source("cv_printing_functions.r")

cv_data <- create_CV_object(
  data_location = "https://docs.google.com/spreadsheets/d/TU_HOJA/edit?usp=sharing"
)
readr::write_rds(cv_data, "cached_positions.rds")
cache_data <- TRUE

# Versión HTML
rmarkdown::render("CV.Rmd",
                  params = list(pdf_mode = FALSE),
                  output_file = "CV.html")

# Versión PDF: primero un HTML temporal y luego a PDF con pagedown
tmp_html_cv_loc <- fs::file_temp(ext = ".html")
rmarkdown::render("CV.Rmd",
                  params = list(pdf_mode = TRUE),
                  output_file = tmp_html_cv_loc)
pagedown::chrome_print(input = tmp_html_cv_loc, output = "CV.pdf")
```

{{< alert icon="github" >}}
Sube tus archivos a GitHub para tener tu CV siempre disponible y actualizado.
{{< /alert >}}

## El resultado

Así se ve el CV de ejemplo generado con este tutorial:

{{< presentacion url="https://eveliacoss.github.io/Make_yourCV/EveliaCoss_cv.pdf" titulo="CV de ejemplo (PDF)" ratio="3/4" >}}

## Para saber más

- [datadrivencv](https://github.com/nstrayer/datadrivencv): tutorial del creador del paquete.
- [Curso de CV en R de Mónica Padilla](https://github.com/mpadilla905/curso-cv/tree/main/slides), presentado en el encuentro de R-Ladies México.
- [CV de Leonardo Collado](https://github.com/lcolladotor/cv)
- En los VieRnes también hubo una clase extra, [Crea tu CV en R](/playlist/2/), con Aline Pingarroni.

{{< github repo="EveliaCoss/Make_yourCV" >}}
