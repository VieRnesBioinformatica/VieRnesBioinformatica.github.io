---
title: "Análisis de scATAC-seq y datos Multiome de PBMCs: teoría y práctica"
date: 2024-11-11
orderByWeight: true  # las secciones van en orden (weight), no por fecha
description: "Tutorial de 5 horas (en inglés) para analizar datos de accesibilidad de cromatina de célula única: control de calidad, integración con scRNA-seq y análisis de motivos con Signac."
---

{{< typeit
  tag=h2
  speed=20
  lifeLike=true
>}}
Analyzing PBMCs scATAC-seq and Multiome data: Theory and practice
{{< /typeit >}}

El scATAC-seq (*single-cell transposase-accessible chromatin sequencing*) es la tecnología más innovadora para estudiar el paisaje regulatorio del genoma en células individuales. En este tutorial se analiza un conjunto de datos de scATAC-seq de **células mononucleares de sangre periférica (PBMCs)** de 10x Genomics, se hace la integración puente (*bridge integration*) con el flujo de Azimuth ATAC y se revisan herramientas estadísticas para analizar, documentar e interpretar los resultados.

🎯 **Objetivos de aprendizaje:**
- Fundamentos del análisis de scATAC-seq y Multiome.
- Preprocesamiento y control de calidad de scATAC-seq.
- Cargar y preprocesar los datos de scATAC-seq, Multiome y la referencia de scRNA-seq.
- Mapear el scATAC-seq mediante integración puente y evaluar las anotaciones resultantes.
- Análisis de motivos con Signac.

## Datos del curso

- **Dónde:** Universidad CES, Medellín, Colombia 🇨🇴, como parte del workshop [*Single Cell Genomic Approaches to Study the Immune System – Latin America & the Caribbean*](https://coursesandconferences.wellcomeconnectingscience.org/event/single-cell-genomic-approaches-to-study-the-immune-system-latin-america-the-caribbean-20241109/) (9 al 11 de noviembre de 2024) de Wellcome Connecting Science
- **Fecha del tutorial:** 11 de noviembre de 2024 · **Duración:** 5 horas
- **Idioma del material:** inglés
- **Instructores:** Evelia Coss (LIIGH-UNAM) y Diego Ramírez (ENES Juriquilla, UNAM)
- **Práctica:** notebooks de Google Colab, sin instalar nada en tu computadora
- **Vinculado con:** [Project JAGUAR](https://jaguar.liigh.unam.mx/)

## Agenda

| Sección | Tema | Instructor(a) |
|---|---|---|
| 1 | Fundamentos de scATAC-seq · Práctica 13: preprocesamiento y control de calidad | Evelia Coss |
| 2 | Práctica 14: análisis downstream · Práctica 15: análisis multimodal e integración con scRNA-seq | Diego Ramírez |
| 3 | Práctica 16: motivos con Signac · Práctica 17: explorar resultados · Otras herramientas | Diego Ramírez y Evelia Coss |

## Material

<a class="presentacion-material" href="https://eveliacoss.github.io/Tutorial_ISCB_LATAM_scATACseq/" target="_blank" rel="noopener">↗ Tutorial completo (en inglés)</a>

{{< github repo="EveliaCoss/Tutorial_ISCB_LATAM_scATACseq" >}}

El material se puede reutilizar citando la fuente, bajo la licencia [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/).

**Si quieres complementar el curso:** revisa también el [Workshop de scRNA-seq](/posts/cursos/scrnaseq/) y el [Curso de supervivencia: scRNA-seq + CITE-seq](/posts/cursos/singlecell/).
