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
series_order: 7
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

## Funciones que vamos a emplear de `dplyr`

-   `select()` : Seleccionar nombres de las columnas. \--\> select(dataframe, columna1, columna2, \... columnax)

-   `filter()` : Filtrar filas por una condicion especifica, apartir de la columna. \--\> filter(dataframe, columna1 == "condicion")

-   `mutate()` : Modificar o agregar columnas. \--\> mutate(dataframe, columna1 = "condicion")

-   `group_by()` : Agrupar informacion de acuerdo a un(as) columna(s) seleccionada(s).

-   `if_else()` : Condicional. \--\> if_else(dataframe, codicion, si se acepta entonces, si se rechaza entonces)

-   `arrange()` : Acomodar los resultados, default de menor a mayor.

-   `count()`: Cuenta los valores de acuerdo a una variable.

-   `left_join()` : Unir dos dataframe con base en una misma columna en comun. \--\> left_join(dataframe1, dataframe2, by = "Columna en comun, mismo nombre")

-   `n_distinct()` : Cuenta las filas unicas.

-   `distinct()` : Muestra las filas duplicadas.

-   `summarise()` : reduce varios valores seleccionados en un resumen.

    Para más información visita el [Github del paquete dplyr](https://github.com/cran/dplyr).

    Para ver todas las funciones existentes del paquete puede ver el [Cheat Sheet](https://raw.githubusercontent.com/rstudio/cheatsheets/main/pngs/thumbnails/data-transformation-cheatsheet-thumbs.png).

## Funciones que vamos a emplear de `reshape2`

-   `melt()` : Modificación el formato de un dataframe.

Para más información visita el [Github del paquete reshape2](https://github.com/cran/reshape2). Aunque este paquete se encuentra descontinuado, aun funcionan las funciones. Fue absorbido posteriormente por el paquete `tidyr`.

Se supone que la función `gather()` del paquete `tidyr` realiza lo mismo que `melt()` del paquete `reshape2`. Hoy lo compararemos ambas.

Para más información visita el [Github del paquete tidyr](https://tidyr.tidyverse.org/).

## Funciones para unir dataframes con el paquete `dplyr`

![](https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/figures/dplyr_joins.png)

### En la Clase 6 vimos:

{{< article link="/posts/viernes-de-bioinformatica-2024/viernes-6/" >}}

-   **Paso 1.** Crear un RBioProject

-   **Paso 2.** Descargar los datos y verificar su ubicación en la carpeta `data/`

-   **Paso 3.** Importar los datos en R

-   **Paso 4.** Renombrar la columna Name en todos los dataframe

-   **Paso 5.** Seleccionar SOLO los datos de Marvel Comics y DC Comics

-   **Paso 6.** Eliminar duplicados

-   **Paso 7.** Seleccionar columnas

-   **Paso 8.** Cambiar formatos en algunas columnas

Todos estos pasos se encuentran en el Script [MarvelvsDCComics_limpieza_script.R](https://github.com/EveliaCoss/ViernesBioinfo2024/blob/main/Practica_Clase6y7/MarvelvsDCComics_limpieza_script.R).

## Importar datos en R

Partiendo del código que ya conocemos, continuamos con el **Script**.

``` r
######
# Script de clase "Intro a R"

# Evelia Coss

# 8 de marzo 2024

#######

indir = "C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Posdoc_LIIGH/VieRnesBioinfo/ViernesBioinfo_2024/Presentaciones/data/"

outdir = "C:/Users/ecoss/OneDrive - CINVESTAV/Documentos/Posdoc_LIIGH/VieRnesBioinfo/ViernesBioinfo_2024/Presentaciones/"

# Cargar las variables infoPowers, infoStats, marvelDcInfo

load(file =  paste0(indir, "Info_data.RData"))
```

El archivo [`Info_data.RData`](https://github.com/EveliaCoss/ViernesBioinfo2024/blob/main/Practica_Clase6y7/Info_data.RData) lo creamos en la clase pasada, por ello, solo cargaremos este archivo.

## Paso 9. Unir dataframes con base en una columna en común (Join Datasets)

Iniciamos con 3 dataframes (`infoCharacters, infoStats` e `infoPowers`). A partir del dataframe `infoCharacters` seleccionamos solo los datos de **Marvel Comics y DC Comics**, limpiamos los duplicados y almacenamos en la variable `marvelDcInfo`.

> **Primera unión**, empleando la columna `Name` contenida en ambos dataframes. Se unieron las columnas seleccionadas con la información básica de cada personaje con los stats de cada uno.

``` r
marvelDcStatsInfo <- left_join(marvelDcInfo, infoStats, by = "Name")

head(marvelDcStatsInfo)[1:5]

#            Name Gender              Race     Publisher Alignment

# 1        A-Bomb   Male             Human Marvel Comics      good

# 2      Abin Sur   Male           Ungaran     DC Comics      good

# 3   Abomination   Male Human / Radiation Marvel Comics       bad

# 4       Abraxas   Male     Cosmic Entity Marvel Comics       bad

# 5 Absorbing Man   Male             Human Marvel Comics      <NA>

# 6  Adam Strange   Male             Human     DC Comics      good
```

> **Segunda unión**, empleando la columna `Name`. Se el dataframe generado co la informacion de los poderes por cada personaje.

``` r
fullMarvelDc <- left_join(marvelDcStatsInfo, infoPowers, by = "Name")

head(fullMarvelDc)[1:5]

#            Name Gender              Race     Publisher Alignment

# 1        A-Bomb   Male             Human Marvel Comics      good

# 2      Abin Sur   Male           Ungaran     DC Comics      good

# 3   Abomination   Male Human / Radiation Marvel Comics       bad

# 4       Abraxas   Male     Cosmic Entity Marvel Comics       bad

# 5 Absorbing Man   Male             Human Marvel Comics      <NA>

# 6  Adam Strange   Male             Human     DC Comics      good
```

## Paso 10. Cambiar formatos en algunas columnas

``` r
fullMarvelDc$Name <- as.factor(fullMarvelDc$Name)
fullMarvelDc$Alignment <- as.factor(fullMarvelDc$Alignment)
```

Si usamos `str()` tendremos desplegado la informacion de todas las 179 columnas presentes en el dataframe, recuerda que puedes usar `dim()` para checar las dimensiones.

```         
dim(fullMarvelDc)
# [1] 586 179
```

## Verificamos los formatos con `class()`

``` r
class(fullMarvelDc$Name)

# [1] "factor"

class(fullMarvelDc$Gender)

# [1] "factor"

class(fullMarvelDc$Race)

# [1] "factor"

class(fullMarvelDc$Publisher)

# [1] "factor"

class(fullMarvelDc$Alignment)

# [1] "factor"
```

## Ejercicios

1\) ¿Cuántos individuos tenemos de cada género (Gender), considerando su raza (Race) y empresa (Publisher)?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#21" target="_self" >}}
Respuesta
{{< /button >}}

2\) ¿Cuántos personajes villanos, neutrales y héroes (su bando, Aligment) por cada empresa?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#22" target="_self" >}}
Respuesta
{{< /button >}}

3\) ¿Cuántos individuos tenemos de cada género (Gender), considerando su bando (Aligment) y empresa (Publisher)?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#23" target="_self" >}}
Respuesta
{{< /button >}}

## Esto es lo que realiza `melt()`

![](https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/figures/melt_Example.png)

## Paso 11. Transformar en una sola columna los poderes usando `melt()`

Reacomodar la tabla de acuerdo a las habilidades o poderes.

La función `melt()` te permite acomodar la tabla, cambiando el formato de la misma de acuerdo a las habilidades o poderes.

``` r
marvelDc <- melt(fullMarvelDc, id = c("Name", "Gender", "Race", "Publisher", "Alignment", "Intelligence.x", "Strength", "Speed", "Durability.x", "Power", "Combat", "Total"))

str(marvelDc)

# 'data.frame':    97862 obs. of  14 variables:

#  $ Name          : Factor w/ 585 levels "A-Bomb","Abin Sur",..: 1 2 3 4 5 6 7 8 9 10 ...

#  $ Gender        : Factor w/ 2 levels "Female","Male": 2 2 2 2 2 2 1 2 2 2 ...

#  $ Race          : Factor w/ 48 levels "Alien","Amazon",..: 20 45 26 10 20 20 NA 20 NA NA ...

#  $ Publisher     : Factor w/ 2 levels "DC Comics","Marvel Comics": 2 1 2 2 2 1 2 2 2 2 ...

#  $ Alignment     : Factor w/ 3 levels "bad","good","neutral": 2 2 1 1 NA 2 NA 2 2 1 ...

#  $ Intelligence.x: int  38 50 63 88 NA 1 NA 10 75 50 ...

#  $ Strength      : int  100 90 80 100 NA 1 NA 8 28 85 ...

#  $ Speed         : int  17 53 53 83 NA 1 NA 13 38 100 ...

#  $ Durability.x  : int  80 64 90 99 NA 1 NA 5 80 85 ...

#  $ Power         : int  17 84 55 100 NA 0 NA 5 72 100 ...

#  $ Combat        : int  64 65 95 56 NA 1 NA 20 95 40 ...

#  $ Total         : int  316 406 436 526 NA 5 NA 61 388 460 ...

#  $ variable      : Factor w/ 167 levels "Agility","Accelerated.Healing",..: 1 1 1 1 1 1 1 1 1 1 ...

#  $ value         : chr  "False" "False" "False" "False" ...
```

Checamos los cambios en el contenido

Se redujo el numero de columnas y las columnas seleccionados se compactaron en una sola columna. Se agrego la columna `value` con valores de TRUE y FALSE, considerando si el personaje tenia o no la habilidad.

``` r
head(marvelDc, 3)

#          Name Gender              Race     Publisher Alignment Intelligence.x

# 1      A-Bomb   Male             Human Marvel Comics      good             38

# 2    Abin Sur   Male           Ungaran     DC Comics      good             50

# 3 Abomination   Male Human / Radiation Marvel Comics       bad             63

#   Strength Speed Durability.x Power Combat Total variable value

# 1      100    17           80    17     64   316  Agility False

# 2       90    53           64    84     65   406  Agility False

# 3       80    53           90    55     95   436  Agility False
```

## Al usar `melt()` se reduce el numero de columnas en 2

```         
dim(marvelDc)
# [1] 97862    14
```

Se redujeron de 179 columnas a 14 columnas. Creando 2 nuevas columnas.

1\) `variable` : Contiene el nombre de los poderes.

2\) `value` : Contiene valores lógicos de acuerdo a cada poder de los personajes.

## Paso 12. Renombrar la columnas

``` r
head(marvelDc, 3)
#          Name Gender              Race     Publisher Alignment Intelligence.x

# 1      A-Bomb   Male             Human Marvel Comics      good             38

# 2    Abin Sur   Male           Ungaran     DC Comics      good             50

# 3 Abomination   Male Human / Radiation Marvel Comics       bad             63

#   Strength Speed Durability.x Power Combat Total variable value

# 1      100    17           80    17     64   316  Agility False

# 2       90    53           64    84     65   406  Agility False

# 3       80    53           90    55     95   436  Agility False
```

Vamos a renombrar la columna `variable` por `SuperPower`.

```         
colnames(marvelDc)[colnames(marvelDc) == "variable"] <- "SuperPower" # Renombrar columna
```

A veces el paquete `dplyr` cambia el nombre de algunas columnas solo agregando `.x`, no es preocupante y podemos corregirlo de la siguiente manera.

``` r
# Corregir nombres de columnas
colnames(marvelDc)[colnames(marvelDc) == "Intelligence.x"] <- "Intelligence"  # Renombrar columna

colnames(marvelDc)[colnames(marvelDc) == "Durability.x"] <- "Durability"  # Renombrar columna
```

## Cambiamos el formato de las columnas

En caso de que las siguientes columnas no se encuentren convertidas.

``` r
marvelDc$Name <- as.factor(marvelDc$Name)

marvelDc$Gender <- as.factor(marvelDc$Gender)

marvelDc$Race <- as.factor(marvelDc$Race)

marvelDc$Publisher <- as.factor(marvelDc$Publisher)

marvelDc$Alignment <- as.factor(marvelDc$Alignment)

marvelDc$SuperPower <- as.factor(marvelDc$SuperPower)
```

## Verificar el formato de las columnas

``` r
class(marvelDc$Name)
# [1] "factor"
class(marvelDc$Gender)
# [1] "factor"
class(marvelDc$Race)
# [1] "factor"
class(marvelDc$Publisher)
# [1] "factor"
class(marvelDc$Alignment)
# [1] "factor"
class(marvelDc$SuperPower)
# [1] "factor"
```

## Paso 13. Selección de habilidades con TRUE

``` r
marvelDc <- marvelDc %>%

  filter(value == "True") %>%

  select(-value) #eliminar columna

head(marvelDc)

#         Name Gender    Race     Publisher Alignment Intelligence Strength Speed

# 1       Ajax   Male  Cyborg Marvel Comics      <NA>           NA       NA    NA

# 2      Amazo   Male Android     DC Comics       bad           75      100   100

# 3      Angel   Male    <NA> Marvel Comics      good           63       13    46

# 4 Angel Dust Female  Mutant Marvel Comics      <NA>           NA       NA    NA

# 5  Annihilus   Male    <NA> Marvel Comics       bad           75       80    47

# 6 Ant-Man II   Male   Human Marvel Comics      good           63       10    23

#   Durability Power Combat Total SuperPower

# 1         NA    NA     NA    NA    Agility

# 2        100   100    100   575    Agility

# 3         64    17     42   245    Agility

# 4         NA    NA     NA    NA    Agility

# 5         56    59     64   381    Agility

# 6         28    32     28   184    Agility
```

## Ejercicios

1\) ¿Quiénes son los personajes con más habilidades/poderes por cada empresa?

``` r
marvelDc %>% group_by(Name, Publisher) %>%
  distinct(SuperPower) %>%
  dplyr::count(Publisher) %>%
  select(Name, Publisher,  Count = n) %>%
  arrange(-Count) %>% # ordenar de max a min
  head(3)

# # A tibble: 3 × 3
# # Groups:   Name, Publisher [3]
#   Name            Publisher     Count
#   <fct>           <fct>         <int>
# 1 Spectre         DC Comics        49
# 2 Amazo           DC Comics        44
# 3 Living Tribunal Marvel Comics    35
```

Spectre es el personaje con más habilidades a comparación de los demás personajes.

> NOTA: Cuando usamos el simbolo `-` en la funcion `arrange()` para ordenar de mayor a menor los valores.

Sin embargo, ser el más habilidoso no implica el más poderoso\...Si observamos sus stats todos son de 1 o menos.

``` r
marvelDc %>% filter(Name == "Spectre"
#       Name Gender          Race Publisher Alignment Intelligence Strength Speed
# 1  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 2  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 3  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 4  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 5  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 6  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 7  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 8  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 9  Spectre   Male God / Eternal DC Comics      good            1        1     1
# 10 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 11 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 12 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 13 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 14 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 15 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 16 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 17 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 18 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 19 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 20 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 21 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 22 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 23 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 24 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 25 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 26 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 27 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 28 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 29 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 30 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 31 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 32 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 33 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 34 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 35 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 36 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 37 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 38 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 39 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 40 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 41 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 42 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 43 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 44 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 45 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 46 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 47 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 48 Spectre   Male God / Eternal DC Comics      good            1        1     1
# 49 Spectre   Male God / Eternal DC Comics      good            1        1     1
#    Durability Power Combat Total             SuperPower
# 1           1     0      1     5                Agility
# 2           1     0      1     5    Accelerated.Healing
# 3           1     0      1     5  Dimensional.Awareness
# 4           1     0      1     5                Stealth
# 5           1     0      1     5      Energy.Absorption
# 6           1     0      1     5                 Flight
# 7           1     0      1     5           Marksmanship
# 8           1     0      1     5              Longevity
# 9           1     0      1     5         Intelligence.y
# 10          1     0      1     5         Super.Strength
# 11          1     0      1     5              Telepathy
# 12          1     0      1     5          Energy.Blasts
# 13          1     0      1     5            Duplication
# 14          1     0      1     5          Size.Changing
# 15          1     0      1     5        Density.Control
# 16          1     0      1     5                Stamina
# 17          1     0      1     5            Super.Speed
# 18          1     0      1     5             Possession
# 19          1     0      1     5         Electrokinesis
# 20          1     0      1     5 Darkforce.Manipulation
# 21          1     0      1     5            Death.Touch
# 22          1     0      1     5          Teleportation
# 23          1     0      1     5                  Magic
# 24          1     0      1     5            Immortality
# 25          1     0      1     5                Phasing
# 26          1     0      1     5      Astral.Projection
# 27          1     0      1     5           Fire.Control
# 28          1     0      1     5        Invulnerability
# 29          1     0      1     5      Energy.Constructs
# 30          1     0      1     5           Force.Fields
# 31          1     0      1     5         Psionic.Powers
# 32          1     0      1     5             Elasticity
# 33          1     0      1     5              Animation
# 34          1     0      1     5           Precognition
# 35          1     0      1     5           Hypnokinesis
# 36          1     0      1     5         Animal.Control
# 37          1     0      1     5        Heat.Generation
# 38          1     0      1     5        Gravity.Control
# 39          1     0      1     5          Light.Control
# 40          1     0      1     5             Levitation
# 41          1     0      1     5            Time.Travel
# 42          1     0      1     5              Illusions
# 43          1     0      1     5          Water.Control
# 44          1     0      1     5         Omnilingualism
# 45          1     0      1     5      Time.Manipulation
# 46          1     0      1     5           Invisibility
# 47          1     0      1     5            Sub.Mariner
# 48          1     0      1     5          Vision...Heat
# 49          1     0      1     5        Reality.Warping
```

Es el personaje con más habilidades, pero tiene sus stats muy bajos.

2\) ¿Quiénes son los personajes con los stats más altos por cada empresa?

``` r
marvelDc %>% arrange(-Intelligence, -Strength, -Speed, -Durability, -Power, -Combat) %>%
  select(-SuperPower) %>%
  distinct() %>% head(5)
#                Name Gender          Race     Publisher Alignment Intelligence
# 1   Mister Mxyzptlk   Male God / Eternal     DC Comics       bad          113
# 2          Superman   Male    Kryptonian     DC Comics      good          100
# 3 Martian Manhunter   Male       Martian     DC Comics      good          100
# 4          Galactus   Male Cosmic Entity Marvel Comics   neutral          100
# 5    Captain Marvel Female    Human-Kree Marvel Comics      good          100
#   Strength Speed Durability Power Combat Total
# 1       10    12         14   100     28   277
# 2      100   100        100    94     85   579
# 3      100    96        100   100     85   581
# 4      100    83        100   100     70   553
# 5      100    67         95    62     56   480
```

> NOTA: Cuando usamos el simbolo `-` en la funcion `select()` estamos eliminando la columna SuperPower.

3\) ¿Existe algún personaje que tenga todos sus stats en 100?

Hay 6 columnas de stats evaluados que sumados nos da la columna Total, osea que los valores maximos se encuentran cercanos a 600 (columnas 6:11).

``` r
# Opcion B
marvelDc %>% select(-SuperPower) %>% distinct() %>% # eliminas duplicados
  filter(Intelligence >= 100 & Strength >= 100 & Speed >= 100 & Durability >= 100 & Power >= 100 & Combat >= 100)
#  [1] Name         Gender       Race         Publisher    Alignment   
#  [6] Intelligence Strength     Speed        Durability   Power       
# [11] Combat       Total       
# <0 rows> (or 0-length row.names)
```

La salida da NINGUNO, ya que no existe un personaje que tenga los 6 Stats con valores de 100.

## Paso 14. Renombrar el formato de Alignment

Cuando usamos la función `if_else()` la empleamos para asignar valores de acuerdo a una conducional.

-   Usage: if_else(condición, TRUE, FALSE)

    -   Condición: Selecciona una columna y verifica que debe cumplir la misma.

    -   TRUE: En caso de que la condición sea VERDADERA, que acción debe hacer.

    -   FALSE: En caso de que la condición sea FALSA, que acción debe hacer

Vamos agregar una nueva columna y vamos a cambiar los valores a usar el bando (Aligment)

``` r
# Opcion A - Función `if_else()`
marvelDc_edited <- marvelDc %>% mutate(Group = 
                    if_else(Alignment == "good", "hero", # Primer if_else
                          if_else(Alignment == "bad","villain", "neutral"))) # Segundo if_else
```

Tambien podemos usar `case_when()`

``` r
# Opcion B - Funcion `case_when()`
marvelDc_edited <- marvelDc %>% mutate(Group = 
                   case_when(Alignment == "good" ~ "hero", 
                             Alignment == "bad" ~ "villain", 
                             TRUE ~ "neutral"))
```

## Ejercicio: Función `if_else()`

¿Quiénes son los hombres más poderosos y malvados?

``` r
marvelDc_edited %>% select(-SuperPower) %>% distinct() %>% # eliminas duplicados
  filter(Gender == "Male" & Group == "villain") %>%
  arrange(-Total)
#                  Name Gender              Race     Publisher Alignment
# 1         General Zod   Male        Kryptonian     DC Comics       bad
# 2      Superboy-Prime   Male        Kryptonian     DC Comics       bad
# 3               Amazo   Male           Android     DC Comics       bad
# 4            Dormammu   Male              <NA> Marvel Comics       bad
# 5            Doomsday   Male             Alien     DC Comics       bad
# 6     Cyborg Superman   Male            Cyborg     DC Comics       bad
# 7               Magus   Male              <NA> Marvel Comics       bad
# 8             Abraxas   Male     Cosmic Entity Marvel Comics       bad
# 9          Black Adam   Male              <NA>     DC Comics       bad
# 10      Fallen One II   Male              <NA> Marvel Comics       bad
# 11           Darkseid   Male           New God     DC Comics       bad
# 12          Onslaught   Male            Mutant Marvel Comics       bad
# 13              Match   Male              <NA>     DC Comics       bad
# 14       Anti-Monitor   Male     God / Eternal     DC Comics       bad
# 15         Apocalypse   Male            Mutant Marvel Comics       bad
# 16               Lobo   Male          Czarnian     DC Comics       bad
# 17             Thanos   Male           Eternal Marvel Comics       bad
# 18             Ultron   Male           Android Marvel Comics       bad
# 19          Destroyer   Male              <NA> Marvel Comics       bad
# 20         Air-Walker   Male              <NA> Marvel Comics       bad
# 21            Carnage   Male          Symbiote Marvel Comics       bad
# 22            Magneto   Male            Mutant Marvel Comics       bad
# 23           Mephisto   Male              <NA> Marvel Comics       bad
# 24              Venom   Male          Symbiote Marvel Comics       bad
# 25        Abomination   Male Human / Radiation Marvel Comics       bad
# 26        Doctor Doom   Male             Human Marvel Comics       bad
# 27           Sinestro   Male         Korugaran     DC Comics       bad
# 28               Loki   Male         Asgardian Marvel Comics       bad
# 29               Kang   Male              <NA> Marvel Comics       bad
# 30           Brainiac   Male           Android     DC Comics       bad
# 31        Swamp Thing   Male     God / Eternal     DC Comics       bad
# 32            Metallo   Male           Android     DC Comics       bad
# 33          Venom III   Male          Symbiote Marvel Comics       bad
# 34          Annihilus   Male              <NA> Marvel Comics       bad
# 35        Iron Monger   Male              <NA> Marvel Comics       bad
# 36           Scorpion   Male             Human Marvel Comics       bad
# 37        Utgard-Loki   Male       Frost Giant Marvel Comics       bad
# 38           Mandarin   Male             Human Marvel Comics       bad
# 39       Doppelganger   Male              <NA> Marvel Comics       bad
# 40            Mach-IV   Male              <NA> Marvel Comics       bad
# 41             Azazel   Male          Neyaphem Marvel Comics       bad
# 42             Exodus   Male            Mutant Marvel Comics       bad
# 43               Bane   Male             Human     DC Comics       bad
# 44              Rhino   Male Human / Radiation Marvel Comics       bad
# 45               Klaw   Male             Human Marvel Comics       bad
# 46         Sabretooth   Male            Mutant Marvel Comics       bad
# 47         Molten Man   Male              <NA> Marvel Comics       bad
# 48           Venom II   Male              <NA> Marvel Comics       bad
# 49       Ra's Al Ghul   Male             Human     DC Comics       bad
# 50           Evilhawk   Male             Alien Marvel Comics       bad
# 51           Blackout   Male             Demon Marvel Comics       bad
# 52     Solomon Grundy   Male            Zombie     DC Comics       bad
# 53            Electro   Male             Human Marvel Comics       bad
# 54             Morlun   Male              <NA> Marvel Comics       bad
# 55               Blob   Male              <NA> Marvel Comics       bad
# 56                Gog   Male              <NA>     DC Comics       bad
# 57           Junkpile   Male            Mutant Marvel Comics       bad
# 58              Joker   Male             Human     DC Comics       bad
# 59         Demogoblin   Male             Demon Marvel Comics       bad
# 60               Zoom   Male              <NA>     DC Comics       bad
# 61        Killer Croc   Male         Metahuman     DC Comics       bad
# 62            Shocker   Male             Human Marvel Comics       bad
# 63           Vanisher   Male              <NA> Marvel Comics       bad
# 64            Vulture   Male             Human Marvel Comics       bad
# 65  Kraven the Hunter   Male             Human Marvel Comics       bad
# 66             Lizard   Male             Human Marvel Comics       bad
# 67    Green Goblin II   Male              <NA> Marvel Comics       bad
# 68    Mister Mxyzptlk   Male     God / Eternal     DC Comics       bad
# 69       Green Goblin   Male             Human Marvel Comics       bad
# 70          Hydro-Man   Male              <NA> Marvel Comics       bad
# 71        Tiger Shark   Male             Human Marvel Comics       bad
# 72       Moses Magnum   Male              <NA> Marvel Comics       bad
# 73         Changeling   Male              <NA> Marvel Comics       bad
# 74          Rick Flag   Male              <NA>     DC Comics       bad
# 75          Kraven II   Male             Human Marvel Comics       bad
# 76      Mister Freeze   Male             Human     DC Comics       bad
# 77           Bullseye   Male             Human Marvel Comics       bad
# 78           Deadshot   Male             Human     DC Comics       bad
# 79             Leader   Male              <NA> Marvel Comics       bad
# 80     Lightning Lord   Male              <NA>     DC Comics       bad
# 81            Big Man   Male              <NA> Marvel Comics       bad
# 82       Proto-Goblin   Male              <NA> Marvel Comics       bad
# 83        Blizzard II   Male              <NA> Marvel Comics       bad
# 84          Scarecrow   Male             Human     DC Comics       bad
# 85               Warp   Male              <NA>     DC Comics       bad
# 86          Red Skull   Male              <NA> Marvel Comics       bad
# 87            Penguin   Male             Human     DC Comics       bad
# 88           Kevin 11   Male             Human     DC Comics       bad
# 89          Chameleon   Male              <NA>     DC Comics       bad
# 90          Blackwing   Male              <NA> Marvel Comics       bad
# 91         Lex Luthor   Male             Human     DC Comics       bad
# 92           Tinkerer   Male              <NA> Marvel Comics       bad
# 93             Walrus   Male             Human Marvel Comics       bad
# 94            Riddler   Male              <NA>     DC Comics       bad
# 95               Pyro   Male              <NA> Marvel Comics       bad
# 96     Doctor Doom II   Male              <NA> Marvel Comics       bad
# 97     Doctor Octopus   Male             Human Marvel Comics       bad
# 98          Weapon XI   Male              <NA> Marvel Comics       bad
# 99    Mister Sinister   Male   Human / Altered Marvel Comics       bad
# 100       Bloodwraith   Male              <NA> Marvel Comics       bad
# 101          Bird-Man   Male             Human Marvel Comics       bad
# 102       Bird-Man II   Male             Human Marvel Comics       bad
# 103              Ammo   Male             Human Marvel Comics       bad
# 104         Hobgoblin   Male              <NA> Marvel Comics       bad
# 105          Blizzard   Male              <NA> Marvel Comics       bad
# 106      Black Abbott   Male              <NA> Marvel Comics       bad
# 107     Razor-Fist II   Male              <NA> Marvel Comics       bad
#     Intelligence Strength Speed Durability Power Combat Total   Group
# 1             94      100    96        100    94     95   579 villain
# 2             94      100   100        100   100     85   579 villain
# 3             75      100   100        100   100    100   575 villain
# 4             88       95    83        100   100     80   546 villain
# 5             88       80    67        120   100     90   545 villain
# 6             75       93    92        100   100     80   540 villain
# 7             88      100    70         99   100     74   531 villain
# 8             88      100    83         99   100     56   526 villain
# 9             88      100    92        100    89     56   525 villain
# 10            88       85    83        100   100     56   512 villain
# 11            88      100    23        100   100     95   506 villain
# 12            88       85    47        100   100     85   505 villain
# 13            75       95    83         85    90     70   498 villain
# 14            88       90    38         90   100     90   496 villain
# 15           100      100    33        100   100     60   493 villain
# 16            88       83    35        100    95     85   486 villain
# 17            88      100    17        100   100     80   485 villain
# 18            88       83    42        100   100     64   477 villain
# 19            50       95    58         98    90     70   461 villain
# 20            50       85   100         85   100     40   460 villain
# 21            63       63    70         84    81     90   451 villain
# 22            88       80    27         84    91     80   450 villain
# 23            88       85    35         95   100     42   445 villain
# 24            75       57    65         84    79     84   444 villain
# 25            63       80    53         90    55     95   436 villain
# 26           100       32    20        100    93     84   429 villain
# 27            75       80    53         64   100     56   428 villain
# 28            88       57    47         85    85     56   418 villain
# 29           100       48    58         70    71     70   417 villain
# 30           100       28    63         90    60     75   416 villain
# 31            88       80    23        100    66     56   413 villain
# 32            75       53    23         95    74     64   384 villain
# 33            63       73    35         90    66     56   383 villain
# 34            75       80    47         56    59     64   381 villain
# 35            88       63    25         90    57     56   379 villain
# 36            50       52    60         85    49     80   376 villain
# 37            50       80    23         84    72     64   373 villain
# 38           100       28    23         28    99     95   373 villain
# 39             8       63    60         95    62     84   372 villain
# 40            75       36    60         84    60     56   371 villain
# 41            50       11    47         95    87     80   370 villain
# 42            63       81    28         28   100     70   370 villain
# 43            88       53    23         56    51     95   366 villain
# 44            25       80    43         90    37     85   360 villain
# 45            63       38    33        100    62     60   356 villain
# 46            55       53    25         90    28    100   351 villain
# 47            50       73    23         84    53     56   339 villain
# 48            50       57    47         70    54     56   334 villain
# 49           100       28    32         42    27    100   329 villain
# 50            50       32    33         70    78     64   327 villain
# 51            63       32    45         80    38     65   323 villain
# 52             9       93    13        100    78     30   323 villain
# 53            69       10    50         56    67     64   316 villain
# 54            63       60    35         42    59     56   315 villain
# 55            10       83    23         95    26     72   309 villain
# 56            50       34    47         72    39     56   298 villain
# 57            50       38    17         90    71     30   296 villain
# 58           100       10    12         56    22     90   290 villain
# 59            50       48    42         35    54     60   289 villain
# 60            50       10   100         28    72     28   288 villain
# 61            25       48    33         85    36     60   287 villain
# 62            63       10    23         70    63     56   285 villain
# 63            63       10    75         56    39     42   285 villain
# 64            63       22    47         56    40     56   284 villain
# 65            63       32    35         42    26     85   283 villain
# 66            38       51    27         70    40     56   282 villain
# 67            75       55    37         50    38     26   281 villain
# 68           113       10    12         14   100     28   277 villain
# 69            75       48    35         48    38     28   272 villain
# 70            38       13    25         80    66     50   272 villain
# 71            38       72    42         70    21     28   271 villain
# 72            75       28    12         42    55     56   268 villain
# 73            63       10    23         42    64     64   266 villain
# 74            88       11    23         28    19     95   264 villain
# 75            50       34    23         28    36     85   256 villain
# 76            75       32    12         70    37     28   254 villain
# 77            50       11    25         70    20     70   246 villain
# 78            50       10    23         28    47     80   238 villain
# 79           100       10    12         14    58     42   236 villain
# 80            44       10    23         42    66     42   227 villain
# 81            75       12    23         28    19     70   227 villain
# 82            63       38    23         48    22     28   222 villain
# 83            38       10    27         42    47     56   220 villain
# 84            81       10    12         14    48     50   215 villain
# 85            38       10    23         28    63     50   212 villain
# 86            75       10    12         14    19     80   210 villain
# 87            75       10    12         28    30     45   200 villain
# 88            25        7    12         14   100     40   198 villain
# 89            88       10    12         28    28     28   194 villain
# 90            38       10    35         32    20     56   191 villain
# 91           100       10    12         14    10     28   174 villain
# 92           100       10    23         14    10     14   171 villain
# 93            50       28     8         50    11     20   167 villain
# 94           100       10    12         14    10     14   160 villain
# 95            38       10    12         14    50     28   152 villain
# 96             1       32     1          1     0      1    36 villain
# 97             1        1     1          1     0      1     5 villain
# 98             1        1     1          1     0      1     5 villain
# 99             1        1     1          1     0      1     5 villain
# 100            1        1     1          1     0      1     5 villain
# 101            1        1     1          1     0      1     5 villain
# 102            1        1     1          1     0      1     5 villain
# 103            1        1     1          1     0      1     5 villain
# 104            1        1     1          1     0      1     5 villain
# 105            1        1     1          1     0      1     5 villain
# 106            1        1     1          1     0      1     5 villain
# 107            1        1     1          1     0      1     5 villain
```

## Guardar el output

Vamos a almacenar la variable marvelDc_edited la cual ya se encuentra limpia de duplicados y mantiene todas las ediciones que le hemos hecho.

``` r
save(marvelDc_edited, file = "Presentaciones/data/marvelDc_edited.RData")
```

## Ejercicios

1\) ¿Quiénes son los personajes más fuertes de cada empresa?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#45" target="_self" >}}
Respuesta
{{< /button >}}

2\) ¿Quiénes son los personajes más inteligentes de cada empresa?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#46" target="_self" >}}
Respuesta
{{< /button >}}

3\) ¿Quiénes son las mujeres más poderosas y malvadas?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#47" target="_self" >}}
Respuesta
{{< /button >}}

4\) ¿Quiénes son los hombres más poderosos y malvados?

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D7_Manipulacion_dplyr.html#48" target="_self" >}}
Respuesta
{{< /button >}}

