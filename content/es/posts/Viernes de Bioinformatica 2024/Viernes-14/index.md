---
title: "Exploración de datos y elección de pruebas o modelos Parte 1"
date: 2024-05-17
draft: false
description: "Modelos"
tags: ["viernes", "bioestadistica", "datos"]
showAuthor: false
authors:
 - "domingo"
series: ["Viernes2024"]
series_order: 14
seriesOpened: true
---

<iframe src="https://drive.google.com/file/d/1FoCG0hKrTzpUCJBquRRnfm1USTDBFF2S/preview" width="100%" height="400" allow="autoplay" allowfullscreen="true">

</iframe>

# Exploración de datos y elección de pruebas
o modelos

#### Domingo Martínez

#### 2024-05-17

# 1 Introducción

En esta sesión vamos a trabajar en los siguientes objetivos de
aprendizaje:

-   Explorar la consistencia y calidad de nuestros datos.

-   Identificar la escala de nuestras variables de interés.

-   Identificar en qué casos podríamos:

    -   Hacer una descripción.

    -   Hacer algúna comparación.

    -   Modelar relaciones "causales".

-   

En este script vamos a trabajar con la misma base de datos utilizada
en el artículo: *"Machine learning in medicine: Performance
calculation of dementia prediction by support vector machines
(SVM)"*, publicado en 2019 por Gopi Battineni, Nalini Chintalapudi,
y Francesco Amenta. Quienes usan la base de datos pública llamada
OASIS-2.

El artículo y repositorios se pueden consultar en:


-   <https://www.oasis-brains.org/>


-   <https://direct.mit.edu/jocn/article/22/12/2677/4983/Open-Access-Series-of-Imaging-Studies-Longitudinal>

-   <https://www.sciencedirect.com/science/article/pii/S2352914819300917?via%3Dihub>

-   <https://doi.org/10.1016/j.imu.2019.100200>

-   <https://data.mendeley.com/datasets/tsy6rbc5d4/1>

-   <https://www.kaggle.com/datasets/shashwatwork/dementia-prediction-dataset?select=dementia_dataset.csv>

La base de datos en cuestión, tiene información clínica,
socio-demográfica, datos de rendimiento cognitivo y datos longitudinales
de imagen cerebral por resonancia magnética de 150 participantes
diestros; con, o sin demencia, con edades entre 60 y 96 años. Las
variables contenidas en la base de datos (OASIS-2) son:

-   Subject ID (Número de identificación del sujeto)

-   MRI ID (Número de identificación temporal de la resonancia,
    recordemos que se trata de un estudio longitudinal con hasta 3
    resonancias separadas por un año)

-   Group {Indica si pertenece al grupo con demencia, sin demencia o
    convertido, estos últimos se habían tratado inicialmente com con
    demencia, luego se trataron como sin demencia}

-   Visit (Indica el número de vistia para adquirir las imágenes de
    resonancia magnética)

-   MR delay (Días transcurridos entre cada resonancia)

-   Sex (Indica el sexo del participante, M = masculino, F =
    femenino)

-   Age (Edad del participante en años cumplidos)

-   Social Economic Status (SES, nivel socio económico con 5 niveles, el
    más alto es 5)

-   Education level (EDUC, nivel de educación en años cursados en el
    sistema escolar)

-   MMSE (mini-mental state examination parameters, indica el resultado
    de la prueba minimental, que sirve para medir el deterioro
    cognitvo)

-   Clinical Dementia Ratio (CDR) Con base en una entrevista, se evalúan
    áreas cognitivas y funcionales del paciente, los códigos son:

    -   0 = sin demencia.

    -   0.5 = demencia muy leve.

    -   1 = demencia leve.

    -   2 = demencia moderada.

    -   3 = demencia severa.

-   Estimated Total Intracranial Volume (e-TIV) Volumen intercranial
    total estimado.

-   Normalized Whole Brain Volume (n-WBV) Volumen normalizado del
    cerebro.

-   Atlas Scaling Factor, convierte "las coordenadas" del cerebro a las
    "coordenadas" del atlas cerebral que se usará.

## 1.1 PASO 1: Lectura de la
base de datos

NOTA: para abrir un chunk de R el atajo es: ctrl + alt + i

```         
bd.demencia <- read.csv("oasis_longitudinal_demographics.csv")
```

Para eachar un ojo a mi base de datos puedo usar el comando
View()

```         
View(bd.demencia)
```

:question:

RETO: ¿Cuántas variables y cuantos registro tenemos?

RETO: ¿Cuántos NAs tengo?

## 1.2 PASO 2: Visualización
de NAs

Podemos usar el paquete visdat para echar un vistazo y saber qué
tantos valores perdidos tengo.

```         
library(visdat)
visdat::vis_miss(bd.demencia)
```

RETO: ¿Cuál es la variable que más valores perdidos tiene?

RETO: ¿Qué debería hacer con los valores perdidos o NAs?

# 2 Tipos de datos

En nuestro ejemplo tenemos una base de datos tabular, o conjunto de
datos tabulares. Aquí la información se estructura de la siguiente
manera, en cada renglón tenemos un caso u observación, y en cada columna
registramos los datos de una, y solo una variable.

En términos generales, la escala de medición en la cual están
registrados los datos de cada variable, para cada sujeto, nos indican el
tipo de valor o dato que tengo registrado.

## 2.1 Escalas de
medición

Las escalas de medición nos permiten organizar los datos en orden
jerárquico, a continuación vamos a describirlas desde la más "simple" a
la más "completa".

Fuentes:

-   Siegel, S., & Castellan, J. (1998). Nonparametric statistics for
    the behavioral sciences- (2nd ed.). Mcgraw-Hill Book Company.

-   <https://en.wikipedia.org/wiki/Level_of_measurement>

### 2.1.1 Escala nominal o
categórica.

Corresponde al nivel de medición "más débil", aquí usamos símbolos
para identificar los grupos a los que pertencen nuestras observaciones.
Por ejemplo, registremos el color favorito de quienes asisten a este
taller.

```         
data.frame(Sujetos_ID=c(1:5),Color_favorito = c("azul",
                                              "verde",
                                              "azul",
                                              "rojo",
                                              "rojo"))
```

|     |
|-----|
|     |

<table>
<thead>
<tr class="header">
<th style="text-align: right;"><p>Sujetos_ID</p>
<p>&lt;int&gt;</p></th>
<th style="text-align: left;"><p>Color_favorito</p>
<p>&lt;chr&gt;</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;"><p>1</p></td>
<td style="text-align: left;"><p>azul</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>2</p></td>
<td style="text-align: left;"><p>verde</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>3</p></td>
<td style="text-align: left;"><p>azul</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>4</p></td>
<td style="text-align: left;"><p>rojo</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>5</p></td>
<td style="text-align: left;"><p>rojo</p></td>
</tr>
</tbody>
</table>

5 rows

En esta escala solo podemos aplicar los operadores matemáticos =

y ≠

; además podemos agrupar y calcular
la moda.

### 2.1.2 Escala
ordinal.

Si en una escala categórica, resulta que, podemos organizar las
categorías de acuerdo a una jerarquía dictada por el operador >

, entonces tenemos una escala
ordinal. Un ejemplo muy común es la escala likert.

Si a cada persona le pedimos que nos diga qué tanto le gusta el
chocolate, de acuerdo a las siguientes opciones: 3 = me gusta mucho, 2 =
me gusta poco, 1 = no me gusta. Entonces tenemos una escala de
intervalo.

```         
data.frame(Sujetos_ID=c(1:5),
           Gusto_por_chocolate = c("1", "3",  "3", "2", "1"))
```

|     |
|-----|
|     |

<table>
<thead>
<tr class="header">
<th style="text-align: right;"><p>Sujetos_ID</p>
<p>&lt;int&gt;</p></th>
<th style="text-align: left;"><p>Gusto_por_chocolate</p>
<p>&lt;chr&gt;</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;"><p>1</p></td>
<td style="text-align: left;"><p>1</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>2</p></td>
<td style="text-align: left;"><p>3</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>3</p></td>
<td style="text-align: left;"><p>3</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>4</p></td>
<td style="text-align: left;"><p>2</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>5</p></td>
<td style="text-align: left;"><p>1</p></td>
</tr>
</tbody>
</table>

5 rows

En esta escala podemos aplicar los operadores >

y <

para ordenar las respuestas. También
podemos calcular la mediana.

:scream:

**IMPORANTE:** ¿Podemos estar segurxs que, la distancia
entre "me gusta poco" a "me gusta mucho", es igual entre todxs nuetrxs
sujetos?

RETO: responde a la pregunta anterior...

### 2.1.3 Escala de
intervalo.

Si, en una escala ordinal, resulta que, podemos conocer el intervalo
(i.e., distancia) entre categorías. En este caso tendremos una escala de
intervalo. Importante: en esta escala, el punto cero y la unidad de
medidas son arbitrarios. El ejemplo más común que tenemos es la
temperatura medida en grados fahrenheit o en grados celcius; el cero es
arbitrario y tenemos dos unidades de medida. No obstante, ambas escalas
tienen la misma cantidad y la misma clase de información.

NOTA: **la razón entre dos intervalos** es independiente
de la unidad de medida y del punto cero, pero, el cero y la unidad de
medida son arbitrarios. Entonces, unidades diferentes arrojarán razones
diferentes.

A diferencia de las escalas anteriores, en la escala de intervalo, sí
podemos aplicar los operadores matemáticos +

y −

. Y ya podemos calcular la media
aritmética.

```         
data.frame(Sujetos_ID=c(1:4),
           Temperatura_corporal_celciuls = c(36.5, 37.2, 38.0, 37.1),
           Temperatura_corporal_fahrenheit = c(97.7, 98.96, 100.4, 98.78)
           )
```

|     |
|-----|
|     |

<table>
<thead>
<tr class="header">
<th style="text-align: right;"><p>Sujetos_ID</p>
<p>&lt;int&gt;</p></th>
<th style="text-align: right;"><p>Temperatura_corporal_celciuls</p>
<p>&lt;dbl&gt;</p></th>
<th style="text-align: right;"><p>Temperatura_corporal_fahrenheit</p>
<p>&lt;dbl&gt;</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;"><p>1</p></td>
<td style="text-align: right;"><p>36.5</p></td>
<td style="text-align: right;"><p>97.70</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>2</p></td>
<td style="text-align: right;"><p>37.2</p></td>
<td style="text-align: right;"><p>98.96</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>3</p></td>
<td style="text-align: right;"><p>38.0</p></td>
<td style="text-align: right;"><p>100.40</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>4</p></td>
<td style="text-align: right;"><p>37.1</p></td>
<td style="text-align: right;"><p>98.78</p></td>
</tr>
</tbody>
</table>

4 rows

### 2.1.4 Escala de
razón.

Si una escala de intervalo tiene un punto cero absoluto o verdadero,
entonces tendremos una escala de razón, porque, **la razón (ratio)
entre dos puntos**, es independiente de la unidad de medida.

Un buen ejemplo es la medición de la masa, sin importar si medimos en
kilogramos o en libras, existe un zero verdadero o absoluto. Y la razón
entre dos pesos es la misma, sin importar que lo midamos en kilogramos o
en libras.

En otras palabras, las razones (ratios) entre dos valores serán
iguales pese que se hayan medido en unidades diferentes. A datos medidos
en esta escala le podemos aplicar la media arítmética y también la
geométrica.

```         
data.frame(Sujetos_ID=c(1:4),
           Peso_kgs = c(62.5, 78.4, 60.1, 82.4),
           Peso_lbs = c(137.79, 172.84, 132.5, 181.66)
           )
```

|     |
|-----|
|     |

<table>
<thead>
<tr class="header">
<th style="text-align: right;"><p>Sujetos_ID</p>
<p>&lt;int&gt;</p></th>
<th style="text-align: right;"><p>Peso_kgs</p>
<p>&lt;dbl&gt;</p></th>
<th style="text-align: right;"><p>Peso_lbs</p>
<p>&lt;dbl&gt;</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: right;"><p>1</p></td>
<td style="text-align: right;"><p>62.5</p></td>
<td style="text-align: right;"><p>137.79</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>2</p></td>
<td style="text-align: right;"><p>78.4</p></td>
<td style="text-align: right;"><p>172.84</p></td>
</tr>
<tr class="odd">
<td style="text-align: right;"><p>3</p></td>
<td style="text-align: right;"><p>60.1</p></td>
<td style="text-align: right;"><p>132.50</p></td>
</tr>
<tr class="even">
<td style="text-align: right;"><p>4</p></td>
<td style="text-align: right;"><p>82.4</p></td>
<td style="text-align: right;"><p>181.66</p></td>
</tr>
</tbody>
</table>

4 rows

*En la "medida" de los posible, siempre nos gustaría tener una
escala de razón.*

RETO: ¿Estas son las únicas escalas de medición?

## 2.2 Tipo o formato de
nuestros datos

Fuente: <https://bookdown.org/chescosalgado/intro_r/tipos-y-estructuras-de-datos-en-r.html>

Normalmente tenemos los siguientes tipos de datos

|     |              |     |                                     |     |
|-----|--------------|-----|-------------------------------------|-----|
|     |              |     |                                     |     |
|     | Tipo de dato |     | Descripción                         |     |
|     |              |     |                                     |     |
|     | Numeric      |     | Números decimales                   |     |
|     |              |     |                                     |     |
|     | Integer      |     | Números enteros                     |     |
|     |              |     |                                     |     |
|     | Character    |     | Cadenas de texto                    |     |
|     |              |     |                                     |     |
|     | Complex      |     | Números complejos                   |     |
|     |              |     |                                     |     |
|     | Logical      |     | Valor verdadero o falso             |     |
|     |              |     |                                     |     |
|     | Factor       |     | Agrupación por categorías y niveles |     |
|     |              |     |                                     |     |

**Y, la pregunta del millón es:**

*¿Qué formato o tipo de datos deben tener cada una de las escalas
de medición descritas anteriormente*

**ACTIVIDAD:** Completa el tipo de datos

-   

-   Escala nominal -\> datos tipo...

-   

-   Escala ordinal -\> datos tipo...

-   

-   Escala de intervalo -\> datos tipo...

-   

-   Escala de razón -\> datos tipo...

-   

RETO: ¿Cómo podemos diferenciar el tipo de datos de una variable en
una escala ordinal en comparación con una variable de razón que
solamente tenga números enteros?

## 2.3 Exploración del tipo
de datos

Ahora, con ayuda de la función str() revisaremos qué formato o tipo
de datos tiene cada una de nuestras variables.

```         
str(bd.demencia)
```

```         
## 'data.frame':    373 obs. of  15 variables:
##  $ Subject.ID: chr  "OAS2_0001" "OAS2_0001" "OAS2_0002" "OAS2_0002" ...
##  $ MRI.ID    : chr  "OAS2_0001_MR1" "OAS2_0001_MR2" "OAS2_0002_MR1" "OAS2_0002_MR2" ...
##  $ Group     : chr  "Nondemented" "Nondemented" "Demented" "Demented" ...
##  $ Visit     : int  1 2 1 2 3 1 2 1 2 3 ...
##  $ MR.Delay  : int  0 457 0 560 1895 0 538 0 1010 1603 ...
##  $ M.F       : chr  "M" "M" "M" "M" ...
##  $ Hand      : chr  "R" "R" "R" "R" ...
##  $ Age       : int  87 88 75 76 80 88 90 80 83 85 ...
##  $ EDUC      : int  14 14 12 12 12 18 18 12 12 12 ...
##  $ SES       : int  2 2 NA NA NA 3 3 4 4 4 ...
##  $ MMSE      : int  27 30 23 28 22 28 27 28 29 30 ...
##  $ CDR       : num  0 0 0.5 0.5 0.5 0 0 0 0.5 0 ...
##  $ eTIV      : num  1987 2004 1678 1738 1698 ...
##  $ nWBV      : num  0.696 0.681 0.736 0.713 0.701 ...
##  $ ASF       : num  0.883 0.876 1.046 1.01 1.034 ...
```

**ACTIVIDAD:** Revisa que, cada variable esté declarada
en el formato o tipo de datos adecuado.

RETO: Si el tipo de los datos no es el adecuado para algunas
variables, entonces formatea al tipo correcto.

TIP: Consulta la descripción de cada variable en la
**Introducción**.

## 2.4 Formateo del tipo de
datos

TIP: Recuerda verificar que tus variables tienen declarado el tipo de
datos correcto.

# 3 Exploración visual de
mi base de datos

A continuación, hagamos una exploración visual inicial a nuestra base
de datos. Este paso es indispensable para identificar errores o
corroborar que nuestra base de datos corresponde a lo esperado.

```         
library(GGally)
```

```         
## Cargando paquete requerido: ggplot2
```

```         
## Registered S3 method overwritten by 'GGally':
##   method from   
##   +.gg   ggplot2
```

```         
ggpairs(data = bd.demencia[,c(3,8)],
        aes(color=Group,
            alpha=0.6),
        title = "Exploración inicial Demencia dataset")
```

```         
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

```         
ggsave("Exploracion_inicial_demencia.png", 
       plot = last_plot(), 
       device = png,
       width = 30,
       height = 20,
       units = c("cm"),
       dpi = 300)
```

```         
## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
```

# 4 Aplicando estadística
para responder preguntas
