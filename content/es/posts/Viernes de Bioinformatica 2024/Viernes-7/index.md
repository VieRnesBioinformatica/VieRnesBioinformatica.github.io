---
title: "Manipulación de datos usando dplyr"
date: 2024-03-15
draft: false
description: "dplyr es una poderosa librería de R que facilita la manipulación de datos. "
tags: ["viernes", "db"]
showAuthor: false
authors:
 - "evelia"
series: ["Viernes2024"]
series_order: 6
seriesOpened: true
---

Con dplyr, puedes filtrar filas, seleccionar columnas, ordenar datos y agrupar datos de forma eficiente.

# Paquetes necesarios

Ya deben tenerlos instalados previo a la clase

``` r
install.packages("dplyr")    # Manipulación de datos
install.packages("tidyr")    # Manipulación de datos
install.packages("tidyverse")# Manipulación de datos
install.packages("reshape2") # Transformación de datos
install.packages("ggplot2")  # Visualización grafica
install.packages("cowplot")  # Generar varios graficos en una misma figura
```

# Cargar paquetes

``` r
library(dplyr)     # Manipulación de datos
library(tidyr)     # Manipulación de datos
library(tidyverse) # Manipulación de datos
library(reshape2)  # Transformación de datos
library(cowplot)   # Visualización grafica
library(ggplot2)   # Generar varios graficos en una misma figura
```

## Paqueterias importantes en la Manipulación de datos en R

-   Tidyverse packages

    -   tidyr

    -   dplyr

    -   ggplot2

    -   readr

    -   purrr

    -   tibble

    -   stringr

    -   forcats

## %\>% pipeline

Empleando el paquete `Tidyverse` y `dplyr` puedes acceder a usar `%>%`, el cual nos permitirá enlazar funciones en la modificación de un dataframe.

``` r
df <- data.frame(genes = paste0("Gen", seq_len(8)), 
                 expression = c(3.8, 5.5, 6.3, 1.8, 9, rep(3,3)), 
                 treatment =c(rep("Control", 4), rep("Condicion1",4)))
df %>% head()
#   genes expression  treatment
# 1  Gen1        3.8    Control
# 2  Gen2        5.5    Control
# 3  Gen3        6.3    Control
# 4  Gen4        1.8    Control
# 5  Gen5        9.0 Condicion1
# 6  Gen6        3.0 Condicion1
```

## Archivo tipo **Tibble**

Cuando trabajamos con los paquetes provenientes de `Tidyverse` los archivos de salida por lo regular son tipo `tibble`, que es parecido a un dataframe, pero puede chocar con algunas paqueterias para manipulacion de dataframe.

Por lo que regularmente convertimos esta salida a dataframe usando `as.data.frame()`

Para más información revisa el paquete [tibble](https://tibble.tidyverse.org/).
