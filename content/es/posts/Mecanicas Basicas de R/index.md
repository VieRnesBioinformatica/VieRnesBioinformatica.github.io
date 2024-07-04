---
title: "Mecanicas Basicas de R"
date: 2024-06-08
draft: false
description: "Mecanicas R"
tags: ["principiante", "R"]
---

## ¿Qué es R?

R es un entorno de desarrollo de software libre y lenguaje de programación.

## ¿Por qué usar R?

Es ampliamente utilizado para la *computación estadística, gráfica, y de machine learning.* Ofrece una amplia variedad de **funciones estadísticas**(modelos lineales y no lineales, pruebas estadísticas clásicas, análisis de series de tiempo, clasificación, agrupamiento, etc.), y para realizar gráficas.


Además, existen numerosas librerías que nos permiten realizar el análisis y más graficas, incluyendo para análisis de datos genómicos.


![Logo de R](img/r-logo.png)

### Meme importante

![Meme de pismaker](img/meme-PM.jpeg "pythonzzz")

## ¿Cómo instalamos R?

Aqui hay una guia para la instalacion de R

{{< article link="/posts/instalacion-de-r/" >}}

## Rstudio

Es recomendable utilizar Rstudio para empezar a programar en R, puedes utilizar la siguiente guia para instalar y empezar un proyecto en Rstudio:



## Comandos Basicos

Podemos entender a R como una consola super poderosa, y como cualquier computadora podemos: sumar, restar, dividir y multiplicar.

```R
#Sumar
2 + 2
#Restar
2 - 2
#Dividir
2 / 2
#Multiplicar
2 * 2
```

Como puedes ver en R, a diferencia de otros lenguajes no es necesario utilizar algún símbolo para indicar el fin de una operación básica. Ademas de esto R puede sacar el **Modulo**, que es el restante de una división.

```R
#Modulo
10 %% 3
#El resultado deberia de ser 1, el restante de division de 10/3
```

R también tiene un comando para obtener la parte entera de una división.

```R
#Parte entera de una division
10 %/% 3 
#El resultado deberia de ser 3
```

Con esto podemos hacer operaciones basicas de calculadora pero querermos ir más allá.

## Variables

En R utilizamos ```<-``` para asignar un valor de cualquier tipo a una **variable**, una variable en programación en simples palabras es el nombre o identificacion que recibe un valor, estas pueden ser estaticas o pueden cambiar, ser locales o globales, etc.

{{< alert >}}
**¡Advertencia!** Para asignar variables globales se usa ```<<-```
{{< /alert >}}

### Asignacion y uso de variables

Tenemos en una situación donde queremos registrar nuestro nombre, edad y fecha de cumpleaños.

```R
#Registraremos nuestro nombre, los nombres son cadenas de caracteres
#es decir su comportamiento es diferente al de los numeros (Por ahora)
#Para escribir una cadena de texto usamos comillas("")('') 
Mi_nombre <- "Jorge Alfredo Suazo Victoria"
#Nuestro cumpleaños va a ser registrado en el siguiente orden [Dia] de [Mes]
#de [año], esto tendra importancia más adelante
Mi_cumpleaños <- "30 de Diciembre de 2005"
#La edad simplemente será un numero
Mi_edad <- 18
```

Si quisieramos imprimir un saludo con estos datos tenemos las siguientes opciones.

```R
#Utilizando la funcion cat(), el separador de cada variable es la coma
cat("¡Hola!, mi nombre es", Mi_nombre ,"tengo" , Mi_edad , "años, y cumplo el" , Mi_cumpleaños)
```
{{< alert icon = "code" >}}
{{< typeit >}}
¡Hola!, mi nombre es Jorge Alfredo Suazo Victoria tengo 18 años, y cumplo el 30 de Diciembre de 2005
{{< /typeit >}}
{{< /alert >}}

```R
#Utilizando sprintf(), es una forma muy parecida a como hacemos cadenas de
#texto en lenguajes como C

print(sprintf("Hola, mi nombre es %s, tengo %d años, y cumplo el %s.", Mi_nombre, Mi_edad, Mi_cumpleaños))
```
{{< alert icon = "code" >}}
{{< typeit >}}
[1] "Hola, mi nombre es Jorge Alfredo Suazo Victoria, tengo 18 años, y cumplo el 30 de Diciembre de 2005."
{{< /typeit >}}
{{< /alert >}}

Las diferencias entre ambos son las siguientes:

### print():
- Devuelve el objeto tal cual, incluyendo comillas si es una cadena de caracteres.
- Útil para imprimir variables, mensajes o resultados con fines de depuración.
- Puede personalizarse con argumentos como **digits** para controlar el número de decimales.
- Puede imprimir varios tipos de objetos, como cadenas, variables, tablas, marcos de datos y más.
### cat():
- Concatena y muestra objetos sin comillas.
- Permite especificar un separador personalizado con sep.
- Solo admite **vectores atómicos** (conjunto de datos del mismo tipo).
- Puede usarse para escribir valores en un archivo.
- Agrega saltos de línea automáticamente si usas ```\"\\n\"``` como separador.
- Elimina información específica del código (por ejemplo, convierte n en una nueva línea).

## Vectores o listas

El siguiente problema sera descifrar que edad tendremos en una fecha impuesta por el usuario, para esto tenemos que desentrañar mi fecha de cumpleaños.

```R
# 
```