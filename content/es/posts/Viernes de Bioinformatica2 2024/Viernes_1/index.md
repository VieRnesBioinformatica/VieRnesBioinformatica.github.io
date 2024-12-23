---
title: "Creación de paquetes en R"
date: 2024-09-06
draft: false
description: "Aprende a crear paquetes en R. Basado en la presentación: <https://eveliacoss.github.io/ViernesBioinfo2024_parte2/creacion_paquetes/slides.html#2>"
tags: ["R", "tutorial", "Rstudio", "viernes"]
showAuthor: false
authors:
  - "joselyn"
series: ["Viernes2024-2"]
series_order: 1
seriesOpened: true
---

# Primeros pasos: Creación del paquete

**1. Revisar si podemos usar el nombre del paquete**
```R
available::available("mipaquete"
```
**2. Crear la estructura inicial del paquete**
```R
usethis::create_package("mipaquete")
```
**3. Podemos agregar la estructura de biocthis**
```R
biocthis::use_bioc_pkg_templates()
```
**4. Pedir que Git ignore el archivo .Rproj**
```R
usethis::use_git_ignore("*.Rproj")
```
**5. Crear el respositorio de GitHub**
```R
usethis::use_github()
```
**6. Crear el archivo Description estilo Bioconductor**
```R
biocthis::use_bioc_description()
```
**7. Crear el archivo README estilo Bioconductor**
```R
biocthis::use_bioc_readme_rmd()
devtools::build_readme()
```
👀 Recuerda guardar los cambios, hacer commit y push.
**8. Crear el archivo NEWS estilo Bioconductor**
```R
biocthis::use_bioc_news_md()
```
**9. Crear los archivos de ayuda para usuarios y contribuidores**
```R
biocthis::use_bioc_coc()
usethis::use_tidy_contributing()
biocthis::use_bioc_support()
biocthis::use_bioc_issue_template()
biocthis::use_bioc_citation()
```

# Buenas prácticas para la construcción de funciones 🐈

## Nombre de la función
Al momento de nombrar la función, asegurate de que cumplan estas características
- Que sea corto y descriptivo
- Separar las palabras con un _
- Establecer una palabra en común al inicio para familias de funciones

Es mejor usar 
```R
use_bioc_citation()
```
que lo siguiente:
```R
citation()
bioc_cit()
usebioccitation()
useBiocCitation()
use.bioc.citation()
```

## Estructura de la función
Puntos a tenere en cuenta:
- Identar las líneas de código
- Agregar comentarios para separar/describir las secciones importantes.
- Usar la sintaxis paquete::funcion() cuando hacemos llamado a funciones de otros paquetes.
  **Ejemplo:**
  ```R
  usethis::use_r("subset_heatmap")
  ```

### Ejemplo practico 🐣
