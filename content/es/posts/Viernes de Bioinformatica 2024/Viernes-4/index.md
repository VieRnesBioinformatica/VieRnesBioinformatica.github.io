---
title: "Introducción a Rmarkdown"
date: 2024-02-23
draft: false
tags: ["Rstudio", "viernes","R"]
showAuthor: false
authors:
 - "alejandra"
series: ["Viernes2024"]
series_order: 4
seriesOpened: true
---

# ¿Que es y para que sirve Rmarkdown?

Es una herramienta que permite escribir documentos dinamicos con código de R, de manera fácil y legible.

# ¿Por que realizar un Rmarkdown?

Nos ayuda a entregar un reporte interactivo ya sea en archivo html o pdf.

# ¿Como creamos un archivo Rmarkdown?

Vayamos a la parte superior al menú Archivos \> Nuevo documento.

### Lo primero que vamos a tener será un archivo vacio así:

![](https://eveliacoss.github.io/ViernesBioinfo2024/Clase4/photo3.png)

Y para poder generar los documentos hay que knitearlo así:

![](images/clipboard-4274746271.png)

Los archivos que se pueden generar son:

PDF (Tesis o curriculum vitae)

html (página web o presentaciones)

Word

## Organización de la información:

**División de titulos:**

```         
# Titulo principal
```

\## Subtitulo 1

\### Subtitulo 2

\#### Subtitulo 3

\##### Subtitulo 4

# Titulo principal

## Subtitulo 1

### Organización de la información:

**División de titulos:**

```         
# Titulo principal

## Subtitulo 1

### Subtitulo 2

#### Subtitulo 3

##### Subtitulo 4
```

# Titulo principal

## Subtitulo 1

### Subtitulo 2

#### Subtitulo 3Subtitulo 2

#### Subtitulo 3

## Organización de la información:

**Estilos de las letras:** para modificar el estilo hay que agregar un '\*' antes y despúes del texto.

```         
italica*
```

\*negritas\*\*

\*\*ambos\*\*\*

\~\~tachado\~\~

\<span style="color:blue"\>Texto azul\</span\>

*italica*.\
**negritas**.\
***ambos***.\
~~tachado~~.\
[Texto azul](#) (La pagina web no soporta span)

## Organización de la información:

**Listas:**

```         
  uno
  
  dos

 - 2a

  - 2b

 * tres

  - 3a

    + 3rd layer

  - 2b

* cuatro
```

-   

-   uno

-   

-   dos

    -   

    -   2a

    -   

    -   2b

    -   

-   

-   tres

    -   

    -   3a

        -   

        -   3rd layer

        -   

    -   

    -   2b

    -   

-   

-   cuatro

## Diferentes lenguajes de programación

### Existen varios lenguajes de programación que se pueden usar en un Rmarkdown

![](https://eveliacoss.github.io/ViernesBioinfo2024/Clase4/photo5.png)

## Diferentes lenguajes de programación

### R

``` r
x = 'hello, world!'
x

# [1] "hello, world!"
```

### Bash

``` bash
x=$(echo 'hello, world!')

echo $x

# hello, world!
```

## Visualización de datos

Vamos a usar un set de data predeterminado de R, este se llama pressure. Y vamos a visualizar los datos con la función head()

``` r
head(pressure)

#   temperature pressure

# 1           0   0.0002

# 2          20   0.0012

# 3          40   0.0060

# 4          60   0.0300

# 5          80   0.0900

# 6         100   0.2700
```

Para ver las estadisticas de estos datos usamos la función summary()

``` r
summary(pressure)

#   temperature     pressure       

#  Min.   :  0   Min.   :  0.0002  

#  1st Qu.: 90   1st Qu.:  0.1800  

#  Median :180   Median :  8.8000  

#  Mean   :180   Mean   :124.3367  

#  3rd Qu.:270   3rd Qu.:126.5000  

#  Max.   :360   Max.   :806.0000
```

Ahora haremos un plot con los datos.

``` r
plot(pressure, type="l", main="Grafica muestra", xlab="Eje X", ylab="Eje Y")
```

![](images/clipboard-1868310836.png)

## Ejercicio:

1.  Crea un Rmarkdown

2.  Carga el siguiente set de datos

``` r
datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/Curso-Titulacion-Data-Science-/master/2020/datos/starwars.csv", encoding = "UTF-8")
```

-   Visualiza los datos usando la funcion (head)

-   Crea Titulos y subtitulos en el archivo usando la tematica del dataset.

## Generacion de tablas

La forma más sencilla es de la siguiente manera:

``` r
Cabecera A | Cabecera B
-- | --
Campo A1 | Campo B1
Campo A2 | Campo B
```

| Cabecera A | Cabecera B |
|------------|------------|
| Campo A1   | Campo B1   |
| Campo A2   | Campo B2   |

Si queremos modificar la alineación de las columnas. Se pueden poner dos puntos para especificar el orden.

``` r
| Objetos a la izquierda    | Obetos centrados   | Objetos a la derecha   |
| :------- | :------: | -------: |
| 1   | a  | i   |
| 2   | b  | ii  |
```

| Objetos a la izquierda | Objetos centrados | Objetos a la derecha |
|------------------------|-------------------|----------------------|
| 1                      | a                 | i                    |
| 2                      | b                 | ii                   |

Tambien podemos generar tablas en formato de html

| Num | Header | Header2 | Header3 |
|-----|--------|---------|---------|
| 1   | first  | 1st     | One     |
| 2   | second | 2nd     | Two     |
| 3   | third  | 3rd     | Three   |

``` r
iris %>%
  head(3) %>%
  DT::datatable()
```

![](images/clipboard-4112008471.png)

## Ejercicio:

Has una tabla con la siguiente informacion:

``` r
head(datos[,1:5])
#   X           name height mass  hair_color
# 1 1 Luke Skywalker    172   77       blond
# 2 2          C-3PO    167   75        <NA>
# 3 3          R2-D2     96   32        <NA>
# 4 4    Darth Vader    202  136        none
# 5 5    Leia Organa    150   49       brown
# 6 6      Owen Lars    178  120 brown, grey
```

## Respuesta del ejericicio
```r
X | name | height | mass | hair_color
-- | -- | -- | -- | -- 
1    | Luke Skywalker | 172 | 77 | blond
2    | C-3PO | 167 | 75 | NA
3 |    R2-D2 |    96 |    32 |    NA
4    | Darth Vader |    202 |    136 |    none
5 |    Leia Organa |    150 |    49 |    brown
6 |    Owen Lars |    178 |    120 |    brown, grey
```

| X   | name           | height | mass | hair_color  |
|-----|----------------|--------|------|-------------|
| 1   | Luke Skywalker | 172    | 77   | blond       |
| 2   | C-3PO          | 167    | 75   | NA          |
| 3   | R2-D2          | 96     | 32   | NA          |
| 4   | Darth Vader    | 202    | 136  | none        |
| 5   | Leia Organa    | 150    | 49   | brown       |
| 6   | Owen Lars      | 178    | 120  | brown, grey |
