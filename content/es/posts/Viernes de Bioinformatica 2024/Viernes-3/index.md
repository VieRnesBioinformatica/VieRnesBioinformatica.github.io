---
title: "Manipulación de datos con R base (matrix y lista)"
date: 2024-02-16
draft: false
description: "Matriz y lista"
tags: ["Rstudio", "viernes","R"]
showAuthor: false
authors:
 - "evelia"
series: ["Viernes2024"]
series_order: 3
seriesOpened: true
---

Matrices y Listas.

## **Matriz (matrix)**

```         
# Opcion A

x <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3)

x

# [,1] [,2] [,3]

# [1,] 1 3 5

# [2,] 2 4 6
```

Ahora que ya conocemos las funciones `seq()` y `seq_len()` podemos crear la matriz de esta manera:

```         
# Opcion B

x <- matrix(seq(1,6), nrow = 2, ncol = 3)

# Opcion C

**x <- matrix(seq_len(6), nrow = 2, ncol = 3)**
```

## **Extraer elementos de una matriz (matrix)**

Al igual que con los dataframe usaremos las filas y columnas (x[fila, columna]) para extraer la información.

```         
x[2,3]
# [1] 6
```

Obtener la información de la columna 1.

```         
x[,1]
# [1] 1 2
```

## **Extraer elementos de una matriz (matrix)**

A diferencia del error que nos daria si no respetamos el [fila, columna], en las matrices si nos dara una salida:

```         
x[2]
# [1] 2
```

Nos da el 2nd elemento contenido en la matriz, recuerdas que los elementos de la matriz al declararla eran c(1,2,3,4,5,6).

> NOTA: Para evitar complicaciones es mejor usar la manera [fila, columna].

## **Ejercicios:**

1)  Genera una matriz de tamano 2 x 3 (filas, columnas) (rows, columns)

```         
# Opcion A

x <- matrix(1:6, nrow = 2, ncol = 3)

# Opcion B

x <- matrix(1:6, 2, 3)

x
```

2)  Sustituir los valores presentes en la columna 3 de la matriz, por los valores 10 y 15

```         
x[, 3] <- c(10,15)

x

#      [,1] [,2] [,3]

# [1,]    1    3   10

# [2,]    2    4   15
```

## **Ejercicios:**

3)  Visualizacion en modo de vector

```         
x[, 3] 
# [1] 10 15
```

4)  Visualizacion en modo de matriz

```         
x[, 3, drop = FALSE]
#      [,1]

# [1,]   10

# [2,]   15
```

## **Ejercicios:**

3)  Visualizacion en modo de vector

```         
x[, 3] 
# [1] 10 15
```

4)  Visualizacion en modo de matriz

```         
x[, 3, drop = FALSE]

#      [,1]

# [1,]   10

# [2,]   15
```

> NOTA: Por default se encuentra como `drop = TRUE` dentro del codigo interno, si queremos visualizar nuestros datos como una matriz de salida, podriamos cambiarlo a `drop = FALSE`.

## **Ejercicios:**

5)  Eliminar la columna 1

```         
x[, -1]

#      [,1] [,2]

# [1,]    3   10

# [2,]    4   15
```

6)  Eliminar multiples columnas y Visualizacion en modo de matriz

```         
x[, -(1:2), drop = FALSE] # es lo mismo que x[, 3, drop = FALSE]

#      [,1]

# [1,]   10

# [2,]   15
```

## **Tambien podemos usar `drop = FALSE` en los dataframes**

En la clase anterior visualizamos los cambios que podemos realizarle al siguiente dataframe.

```         
df <- data.frame(genes = paste0("Gen", seq_len(8)), 

      expression = c(3.8, 5.5, 6.3, 1.8, 9, rep(3,3)), 

      treatment =c(rep("Control", 4), rep("Condicion1",4)))
```

Si quiero visualizar los primeros 3 datos de la columna 1 en forma de matriz

```         
head(df[,2, drop = FALSE],3)

#   expression

# 1        3.8

# 2        5.5

# 3        6.3
```

## **Propiedades de las matrices**

Estructura de la matriz:

```         
str(x)

#  num [1:2, 1:3] 1 2 3 4 10 15

class(x)

# [1] "matrix" "array"
```

Dimensiones:

```         
dim(x)

# [1] 2 3
```

A diferencia de una dataframe, en la matriz el nombre de las filas y columnas es un valor `NULL`.

```         
rownames(x) 

# NULL

colnames(x)

# NULL
```

## **Renombrar filas y columnas en la matriz**

Recuerda que es una matriz de 2 filas con 3 columnas:

```         
# Renombrar filas
rownames(x) <- c("Gen1", "Gen2")

x

#      [,1] [,2] [,3]

# Gen1    1    3   10

# Gen2    2    4   15
```

```         
# Renombrar columnas
colnames(x) <- c("Condicion1", "Condicion2", "Condicion3")

x

#      Condicion1 Condicion2 Condicion3

# Gen1          1          3         10

# Gen2          2          4         15
```

## **Operaciones en una matriz**

Dividir toda la matriz entre 2.

```         
x / 2

#      Condicion1 Condicion2 Condicion3

# Gen1        0.5        1.5        5.0

# Gen2        1.0        2.0        7.5
```

Elevar a la 2:

```         
x ** 3

#      Condicion1 Condicion2 Condicion3

# Gen1          1         27       1000

# Gen2          8         64       3375
```

## **Transponer o invertir la matriz**

Usando la funcion `t()`. Se puede emplear en un dataframe tambien.

```         
t(x)

#            Gen1 Gen2

# Condicion1    1    2

# Condicion2    3    4

# Condicion3   10   15
```

## **Agregar información en la matriz (por columnas)**

```         
# matriz 1

matriz1 <- matrix(c("apple", "banana", "cherry", "orange","grape", "pineapple", "pear", "melon", "fig"), nrow = 3, ncol = 3)

# matriz 2

matriz2 <-  matrix(c("strawberry", "blueberry", "raspberry"), nrow = 3, ncol = 1)

# Juntar matrices

newmatrix <-  cbind(matriz1, matriz2)

newmatrix

#      [,1]     [,2]        [,3]    [,4]        

# [1,] "apple"  "orange"    "pear"  "strawberry"

# [2,] "banana" "grape"     "melon" "blueberry" 

# [3,] "cherry" "pineapple" "fig"   "raspberry"
```

> NOTA: `cbind()` nos permite unir por columnas las dos matrices, respetando que ambas tienen 3 filas.

## **Agregar información en la matriz (por filas)**

```         
# Crear una nueva matriz mientras juntamos a la matriz 1

newmatrix <- rbind(matriz1, c("strawberry", "blueberry", "raspberry"))

newmatrix

#      [,1]         [,2]        [,3]       

# [1,] "apple"      "orange"    "pear"     

# [2,] "banana"     "grape"     "melon"    

# [3,] "cherry"     "pineapple" "fig"      

# [4,] "strawberry" "blueberry" "raspberry"
```

> NOTA: `rbind()` nos permite unir por filas respetando que tenemos 3 elementos por fila.

## **Extraer datos en una matriz**

Para un solo elemento, visualizacion tipo matriz

```         
# Opcion A

newmatrix == "apple"

#       [,1]  [,2]  [,3]

# [1,]  TRUE FALSE FALSE

# [2,] FALSE FALSE FALSE

# [3,] FALSE FALSE FALSE

# [4,] FALSE FALSE FALSE
```

Para un solo elemento, visualizacion tipo vector

```         
# Opcion B

newmatrix %in% "apple"

#  [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

## **Extraer datos en una matriz**

Para multiples elementos, visualizacion tipo matriz

```         
# Opcion A

newmatrix == c("apple", "melon")

#       [,1]  [,2]  [,3]

# [1,]  TRUE FALSE FALSE

# [2,] FALSE FALSE  TRUE

# [3,] FALSE FALSE FALSE

# [4,] FALSE FALSE FALSE
```

Para multiples elementos, visualizacion tipo vector

```         
# Opcion B

newmatrix %in% c("apple", "melon")

#  [1]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
```

## **Crear una lista (list)**

Primero veamos como se declara una lista y su estructura:

```         
# Declarar una lista, cada elemento esta separado por una coma

mylist <- list("8", c(1,2,3))

mylist

# [[1]]

# [1] "8"

# 

# [[2]]

# [1] 1 2 3
```

Estructura de la lista

```         
str(mylist)

# List of 2

#  $ : chr "8"

#  $ : num [1:3] 1 2 3
```

Una lista puede contener vectores y matrices dentro:

```         
myvector <- 1:10

mymatrix <- matrix(1:4, nrow = 2)

mydf     <- data.frame("num" = 1:3, "let" = c("a", "b", "c"))

```

Guardamos todo en la lista:

```         
mylist <- list( 

  "vector" = myvector,

  "matriz" = mymatrix,

  "dataframe" = mydf

)

str(mylist)

# List of 3

#  $ vector   : int [1:10] 1 2 3 4 5 6 7 8 9 10

#  $ matriz   : int [1:2, 1:2] 1 2 3 4

#  $ dataframe:'data.frame':    3 obs. of  2 variables:

#   ..$ num: int [1:3] 1 2 3

#   ..$ let: chr [1:3] "a" "b" "c"
```

**Propiedades de una lista**

El largo de una lista es igual al número de elementos que contiene, sin importar de qué tipo o clase sean.

```         
length(mylist)

# [1] 3
```

Dado que una lista siempre tiene una sola dimensión, la función dim() nos devuelve `NULL`.

```         
dim(mylist)

# NULL
```

Las listas tienen clase list, sin importar qué elementos contienen.

```         
class(mylist)

# [1] "list"
```

## **Extraer elementos de una lista**

Para una lista, puede utilizar corchetes simples [ ] o corchetes dobles [[ ]], dependiendo de lo que desee extraer.

```         
mylist <- list(myvector, mymatrix, mydf)

mylist

# [[1]]

#  [1]  1  2  3  4  5  6  7  8  9 10

# 

# [[2]]

#      [,1] [,2]

# [1,]    1    3

# [2,]    2    4

# 

# [[3]]

#   num let

# 1   1   a

# 2   2   b

# 3   3   c
```

Elementos en esta lista, las sublistas:

-   [[1]] - Vector (myvector)

-   [[2]] - Matriz (mymatrix)

-   [[3]] - dataframe (mydf)

Podemos utilizar [ ] para extraer una sublista que sólo contenga, por ejemplo, el primer elemento, que es el vector

```         
mylist[1]

# [[1]]

#  [1]  1  2  3  4  5  6  7  8  9 10
```

Tambien podemos utilizar [[ ]] para extraer un único elemento, que tendrá la clase de ese elemento.

```         
mylist[[1]]

#  [1]  1  2  3  4  5  6  7  8  9 10
```

En este caso para obtener el primer elemento de esta sublista, emplearemos lo visto en la clase anterior sobre dataframe.

```         
mylist[[1]][1]

# [1] 1
```

Asignar nombres a cada sublista

```         
names(mylist) = c("vector", "matriz", "dataframe")
```

Para obtener una sublista, podemos emplear lo visto para dataframe, empleando el nombre de la sublista.

```         
mylist$vector

#  [1]  1  2  3  4  5  6  7  8  9 10
```

O puedes usar:

```         
mylist[["vector"]]

#  [1]  1  2  3  4  5  6  7  8  9 10
```

Entonces para obtener el primer elemento de la sublista vector puedo hacerlo de la siguiente manera:

```         
# Opcion A

mylist[[1]][1]

# [1] 1

# Opcion B

mylist$vector[1]

# [1] 1

# Opcion C

mylist[["vector"]][1]

# [1] 1
```

## **Otra forma de extraer elementos de una lista**

Extraer el 3er elemento de la primera sublista.

```         
# Opcion A

mylist[[1]][3]

# [1] 3

# Opcion B

mylist[[c(1, 3)]]

# [1] 3
```

> NOTA: Dentro del c(), primero colocamos la sublista y luego el elemento. c(sublista, elemento).

## **Extraer multiples sublistas**

Si queremos las dos primeras sublistas, usaremos [] para seleccionarlas

```         
# Opcion A

mylist[c(1, 2)]

# $vector

#  [1]  1  2  3  4  5  6  7  8  9 10

# 

# $matriz

#      [,1] [,2]

# [1,]    1    3

# [2,]    2    4

# Opcion B

mylist[c("vector", "matriz")]

# $vector

#  [1]  1  2  3  4  5  6  7  8  9 10

# 

# $matriz

#      [,1] [,2]

# [1,]    1    3

# [2,]    2    4
```

> NOTA: Son [] simples para llamar sublistas y [[]] para nombrar a los elementos de las sublistas.

## **Operaciones en una lista**

Podemos realizar operaciones si especificamos a que elemento de la lista queremos ejecutarle alguna operacion.

```         
mylist[[1]] * 2

#  [1]  2  4  6  8 10 12 14 16 18 20
```

> NOTA: No olvides los [[]] para indicar los elementos contenidos en la lista.

## **Filtrar algunos elementos**

Podemos emplear nuestros conocimientos previos para buscar elementos en una sublista:

```         
# Ejemplo 1

mylist$matriz[mylist$matriz == 2]

# [1] 2

# Ejemplo 2

mylist$dataframe[mylist$dataframe == "a"]

# [1] "a"
```

## **Sustituir un elemento**

```         
mylist$matriz[1] <- 5

mylist$matriz

#      [,1] [,2]

# [1,]    5    3

# [2,]    2    4
```

## **Eliminar una sublista**

Para eliminar una sublista debemos darle el valor de `NULL`. En este caso eliminaremos el primera sublista (elemento) que es el vector.

```         
mylist[[1]] = NULL

mylist

# $matriz

#      [,1] [,2]

# [1,]    5    3

# [2,]    2    4

# 

# $dataframe

#   num let

# 1   1   a

# 2   2   b

# 3   3   c
```

## **Agregar una nueva sublista**

Para agregar una sublista usaremos `$`.

```         
mylist$occupation <- "Analista de datos"

mylist

# $matriz

#      [,1] [,2]

# [1,]    5    3

# [2,]    2    4

# 

# $dataframe

#   num let

# 1   1   a

# 2   2   b

# 3   3   c

# 

# $occupation

# [1] "Analista de datos"
```

## **Agregar una lista existente**

```         
frutas <- list( c("manzana", "pera", "uva")) 

mylist <- c(mylist, "frutas" = frutas)  

mylist  

# $matriz

#      [,1] [,2]

# [1,]    5    3

# [2,]    2    4

# 

# $dataframe

#   num let

# 1   1   a

# 2   2   b

# 3   3   c

# 

# $occupation

# [1] "Analista de datos"

# 

# $frutas

# [1] "manzana" "pera"    "uva"
```

## **Usar `append()`**

Sirve para agregar elementos a una lista. Toma tres argumentos: la lista original, los elementos a añadir y la posición en la vamos a añadirlos.

```         
append(mylist, #lista original
list(c("azul", "rojo", "verde", "negro")), #elementos por agregar en formato de lista

       after = 2 # Posicion

       )

# $matriz

#      [,1] [,2]

# [1,]    5    3

# [2,]    2    4

# 

# $dataframe

#   num let

# 1   1   a

# 2   2   b

# 3   3   c

# 

# [[3]]

# [1] "azul"  "rojo"  "verde" "negro"

# 

# $occupation

# [1] "Analista de datos"

# 

# $frutas

# [1] "manzana" "pera"    "uva"

```

## **Ejercicios**

1) Crea una lista con los nombres de los amigos, Rosita, Rachel y Joey. La lista debe llamarse `friends`. NOTA: Cada amigo es una sublista.

2) Agrega a la lista el nombre de Carlos, despues de Rachel. Empleando la funcion `append()`

3) Agrega a los amigos Monica y Carmen, al final de la lista. Emplea `c()`.

4) Elimina a Carlos de la lista de friends.

{{< button href="https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D3_ManipulacionDatos_P2.html#39" target="_self" >}}
Respuestas
{{< /button >}}


[Fuentes (Viernes 3)](https://eveliacoss.github.io/ViernesBioinfo2024/Clase1/D3_ManipulacionDatos_P2.html#1): 
{{< github repo="EveliaCoss/ViernesBioinfo2024" >}}