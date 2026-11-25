---
title: "Análisis de datos de RNA-Seq"
date: 2023-11-06
orderByWeight: true  # los días van en orden (weight: 1..5), no por fecha
description: "Workshop de 5 sesiones: del control de calidad de los fastq a la expresión diferencial y el análisis funcional."
---

{{< typeit
  tag=h2
  speed=20
  lifeLike=true
>}}
Workshop: Análisis de datos de RNA-Seq
{{< /typeit >}}

⭐ **Objetivo:** aprender el flujo completo de un análisis de RNA-Seq, desde la calidad de las lecturas hasta la expresión diferencial y el análisis funcional, con programas de código abierto y datos públicos.

- **Fechas:** 6 al 10 de noviembre de 2023 (5 sesiones de 2 horas)
- **Modalidad:** en línea, totalmente gratuito; las clases quedaron grabadas
- **Instructores:** Dra. Evelia Coss, Sofía Salazar y Diego Ramírez
- **Coordinación:** Dra. Evelia Coss, LIIGH-UNAM

## Temario

| Día | Tema | Instructor(a) |
|---|---|---|
| 1 | Aspectos generales de RNA-Seq y control de calidad | Evelia Coss |
| 2 | Alineamiento, ensamblaje y conteo; importar datos en R | Sofía Salazar |
| 3 | Datos de RNA-Seq de distintas fuentes en R | Sofía Salazar |
| 4 | Normalización, corrección por batch y expresión diferencial (DESeq2 y edgeR) | Diego Ramírez |
| 5 | GSEA: análisis funcional | Diego Ramírez |

## Requisitos

- Una terminal: en Windows [MobaXterm](https://mobaxterm.mobatek.net/) o la terminal de [Visual Studio Code](https://code.visualstudio.com/); Mac y Linux ya la incluyen.
- Conocimientos básicos de R, con R (4.3 o superior) y RStudio instalados.
- Paquetes de Bioconductor y CRAN:

```r
# Bioconductor
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("DESeq2", "tximport", "topGO", "biomaRt"))

# CRAN
install.packages(c("tidyverse", "ggrepel"))
```

## Material

{{< github repo="EveliaCoss/RNASeq_Workshop_Nov2023" >}}

El material se distribuye bajo la licencia [Creative Commons Attribution-NonCommercial 4.0](https://creativecommons.org/licenses/by-nc/4.0/). Gracias al [LIIGH-UNAM](https://liigh.unam.mx) por el apoyo para impartir este curso.
