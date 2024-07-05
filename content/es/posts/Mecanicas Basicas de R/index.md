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

### Tipos de Variables

En R, existen varios tipos de variables que puedes utilizar en tus análisis y programación. Estos están los más comunes:

-**Numérico (numeric)**: Representa valores decimales, como 4.5. También incluye números enteros (integers).

-**Carácter (character)**: Se utiliza para almacenar texto o cadenas de caracteres. Por ejemplo, “Hola, mundo”.

-**Lógico (logical)**: Puede tomar dos valores: TRUE o FALSE. Se utiliza para expresar condiciones o respuestas binarias.

-**Complejo (complex)**: Representa números complejos, como 3 + 2i.

-**Crudo (raw)**: Almacena datos en formato binario sin procesar.

-Además, hay otros tipos más avanzados, como **factores** (que representan categorías).

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

En R, las diferencias principales entre un vector y una lista son las siguientes:

#### Unidimensional vs. Multidimensional:
- Un **vector** es un objeto unidimensional. Puede contener elementos del mismo tipo (numéricos, lógicos, caracteres, etc.).
- Una lista, en cambio, es un objeto multidimensional. Puede contener elementos de diferentes tipos.
#### Estructura y Contenido:
- Los **vectores** contienen elementos homogéneos (del mismo tipo).
- Las **listas** pueden contener elementos heterogéneos (de diferentes tipos), incluso otras listas.


El siguiente problema sera descifrar que edad tendremos en una fecha impuesta por el usuario, para esto tenemos que desentrañar mi fecha de cumpleaños.

```R
#Utilizaremos el comando strsplit(), este comando separa un string (cadena de
#texto) usando el separador que establece el usuario, ejemplo: strsplit(Mi_cadena, "separador")

Mi_cumpleaños_separado <- strsplit(Mi_cumpleaños, " ")

print(Mi_cumpleaños_separado)

```
{{< alert icon = "code" >}}
{{< typeit >}}
[[1]]
[1] "30"        "de"        "Diciembre" "de"        "2005"  
{{< /typeit >}}
{{< /alert >}}

```R
#Veremos que tipo de objeto es Mi_cumpleaños_separado

class(Mi_cumpleaños_separado)

```

{{< alert icon = "code" >}}
{{< typeit >}}
[1] "list"
{{< /typeit >}}
{{< /alert >}}

### Listas 

Una **lista en R** es una colección ordenada de cualquier objeto. A diferencia de los vectores y las matrices, donde los elementos deben ser del mismo tipo, en el caso de las listas, los elementos pueden ser de diferentes tipos o almacenar distintas estructuras.

En una lista, se pueden extraer elementos de la siguiente forma:

```R
#El primer renglon se escribe [[n]] y para la columna es [m]

Dia_de_mi_cumple <- Mi_cumpleaños_separado[[1]][1]

#Si quisieramos agregar otro renglon es de la siguiente manera

Mi_cumpleaños_separado[[2]] <- list() #Le decimos que la segunda seccion de 
                                      #la lista tambien es una lista (xd)
Mi_cumpleaños_separado[[2]][1] <- "howdy"

print(Mi_cumpleaños_separado[[2]][1]) #Comprobacion
```

{{< alert icon = "code" >}}
{{< typeit >}}
[1] "howdy"
{{< /typeit >}}
{{< /alert >}}

```R
#Vamos a guardar el dia, mes y año en diferentes variables

Dia_cumple <- Mi_cumpleaños_separado[[1]][1]

Mes_cumple <- Mi_cumpleaños_separado[[1]][3]

Año_cumple <- Mi_cumpleaños_separado[[1]][5]

#Listo, ahora revisaremos que tipo de objeto es cada uno

cat(class(Dia_cumple), class(Mes_cumple), class(Año_cumple))
```
{{< alert icon = "code" >}}
{{< typeit >}}
character character character
{{< /typeit >}}
{{< /alert >}}

El unico que concuerda es el mes, porque el dia y el año son numeros, para cambiar el tipo de variable debemos hacer lo siguiente.

```R
#La función as.numeric() se utiliza para convertir un valor o una cadena de
#texto en un número decimal (de punto flotante) en R. Cuando aplicas
#as.numeric() a una cadena de caracteres que representa un número, R intenta
#interpretarla como un número y devuelve el valor numérico correspondiente.

as.numeric(Dia_cumple)

#Comprobamos

print(class(Dia_cumple))
```

{{< alert icon = "code" >}}
{{< typeit >}}
[1] character
{{< /typeit >}}
{{< /alert >}}

Al pareceer no se guardo el cambio que realizamos.

{{< alert cardColor="#FFAA5A" textColor="#191919" iconColor="#FF785A" >}}
**¡Advertencia!** Para darle un nuevo valor o clase a una variable hay que sobreescribirla 
{{< /alert >}}

```R
#Sobreescribimos
Dia_cumple <- as.numeric(Dia_cumple)

Año_cumple <- as.numeric(Año_cumple)

cat(class(Dia_cumple), class(Año_cumple))
```
{{< alert icon = "code" >}}
{{< typeit >}}
numeric numeric
{{< /typeit >}}
{{< /alert >}}

Listo ahora falta cambiar los meses a numeros, pero como son puramente texto tenemos que hacer cambios más radicales.

![Chascarrillo_digital](img/Chascarrillo_digital.jpeg)

### Declaraciones Condicionales
#### if y else

Basicamente, if es si pasa algo y else es si no pasa ese algo.

Ejemplo:
Si tengo 30 pesos me compro un elote y si no me pongo a llorar.

##### **Operadores comunes** 

- **Igualdad (==):**  El operador ```==``` se utiliza para verificar si dos valores son iguales.

- **Desigualdad (!=):**  El operador ```!=``` se utiliza para verificar si dos valores **no** son iguales.

- **Mayor (>):**  El operador ```>``` verifica si el valor de la izquierda es mayor al valor de la derecha.

- **Mayor o Igual (>=):**  El operador ```>=``` verifica si el valor de la izquierda es mayor o igual al valor de la derecha.

- **Menor (<):**  El operador ```<``` verifica si el valor de la izquierda es menor al valor de la derecha.

- **Menor o Igual (<=):**  El operador ```<=``` verifica si el valor de la izquierda es menor o igual al valor de la derecha.

{{< mermaid >}}
graph TD;
Title(Problema del elote)---> A[Dinero]
A[Dinero]-->B{¿Tienes 30 pesos?};
B --SI---> Si[Feli]
B --NO---> No[Tite]
{{< /mermaid >}}

```R
# El dinero es igual a 30
Money <- 30
# ¿El dinero es igual a 30?
if(Money == 30){ #Si

  print("feli")

}else{ #No

  print("tite")

}

```



{{< alert icon = "code" >}}
{{< typeit >}}
[1] "feli"
{{< /typeit >}}
{{< /alert >}}

Pero... ¿Y si tenemos más de dos opciones?(if(options != 2))

#### ifelse

Si tengo exactamente 30 pesos, quiero imprimir ‘Justo’. Si tengo más de 30 pesos, quiero imprimir ‘Espero cambio devuelta’. Y si no tengo dinero, quiero imprimir ‘tite’.

{{< mermaid >}}
graph TD;
Title(Problema del elote)---> A[Dinero]
A[Dinero]-->B{¿Tienes 30 pesos?};
B --SI---> Si[Feli]
B --NO---> No{Menos o mas}
No --"-"---> D[tite]
No --"+"---> C[Espero Cambio]
{{< /mermaid >}}

```R
# El dinero es igual a 30
dinero <- 30
# ¿El dinero es igual a 30?
ifelse(dinero == 30, "Justo",
       ifelse(dinero > 30, "Espero cambio devuelta", "tite"))
#En R funciona un comando en diferentes lineas hasta que se cierra el parentesis
```
{{< alert icon = "code" >}}
{{< typeit >}}
[1] "Justo"
{{< /typeit >}}
{{< /alert >}}


Con esto podemos hacerenos una idea de como hacer que los meses en texto se vuelvan numeros. Lo voy a hacer pero despues veremos una forma más eficiente de hacerlo.

```R
#Sobreescribir
Mes_cumple <- ifelse(Mes_cumple == "Diciembre", 12,
               ifelse(Mes_cumple == "Noviembre", 11,
                ifelse(Mes_cumple == "Octubre", 10,
                 ifelse(Mes_cumple == "Septiembre", 9,
                  ifelse(Mes_cumple == "Agosto", 8,
                   ifelse(Mes_cumple == "Julio", 7,
                    ifelse(Mes_cumple == "Junio", 6,
                     ifelse(Mes_cumple == "Mayo", 5,
                      ifelse(Mes_cumple == "Abril", 4,
                       ifelse(Mes_cumple == "Marzo", 3,
                        ifelse(Mes_cumple == "Febrero", 2,
                         ifelse(Mes_cumple == "Enero", 1, "NA"))))))))))))
#Al final se puso "NA"(No aplica) Si no concuerda con ningun mes existente

print(Mes_cumple)
```

{{< alert icon = "code" >}}
{{< typeit >}}
[1] 12
{{< /typeit >}}
{{< /alert >}}


#### Switch case

El switch es como si verdaderamente estuvieramos añadiendo mas opciones,
ifelse se parece más a:

{{< mermaid >}}
graph TD;
Title(Ifelse)---> A[variable]
A --> B{condicion1}
B --Si---> Af[Fin1]
B --"No"---> C{Condicion2}
C --"Si"---> Bf[Fin2]
C --"No"---> D{Condicion3}
D --"Si"---> Cf[Fin3]
D --"No"---> Df[Fin4]
{{< /mermaid >}}

Y asi, pero switch es como:

{{< mermaid >}}
graph TD;
Title(Switch)---> A[variable]
A --> B{condicion1}
B --case1---> Af[Fin1]
B --case2---> Bf[Fin2]
B --case3---> Cf[Fin3]
B --case4---> Df[Fin4]
{{< /mermaid >}}

Ahora como se veria en codigo

```R
Mes_cumple <- switch(Mes_cumple,
                     "Diciembre" = 12,
                     "Noviembre" = 11,
                     "Ocutubre" = 10,
                     "Septiembre" = 9,
                     "Agosto" = 8,
                     "Julio" = 7,
                     "Junio" = 6,
                     "Mayo" = 5,
                     "Abril" = 4,
                     "Marzo" = 3,
                     "Febrero" = 2,
                     "Enero" = 1,
                     "default" = "NA")
print(Mes_cumple)
``` 

{{< alert icon = "code" >}}
{{< typeit >}}
[1] 1
{{< /typeit >}}
{{< /alert >}}

¡¿Que!? ¿Por que **1**?, Bueno anteriormente hicimos el mismo ejercicio pero con ifelse entonces el valor de Mes_cumple quedo en 12.

{{< mermaid >}}
graph LR;
A[""Diciembre""] --ifelse---> B[12] --switch---> C[1]
{{< /mermaid >}}

El 1 se debe a que en switch si el input (El valor de entrada) es un numero, lo que va a hacer es buscar la posicion del input, en este caso buscó la posicion numero 12 que corresponde a "Enero" = 1. Vamos a volver a hacerlo: 

```R
Mes_cumple <- "Diciembre"
Mes_cumple <- switch(Mes_cumple,
                     "Diciembre" = 12,
                     "Noviembre" = 11,
                     "Ocutubre" = 10,
                     "Septiembre" = 9,
                     "Agosto" = 8,
                     "Julio" = 7,
                     "Junio" = 6,
                     "Mayo" = 5,
                     "Abril" = 4,
                     "Marzo" = 3,
                     "Febrero" = 2,
                     "Enero" = 1,
                     "default" = "NA")
print(Mes_cumple)
``` 
{{< alert icon = "code" >}}
{{< typeit >}}
[1] 12
{{< /typeit >}}
{{< /alert >}}

{{< mermaid >}}
graph LR;
A[""Diciembre""] --switch---> C[12]
{{< /mermaid >}}

¡Perfecto! Ya tenemos todos las variables en numeros, ahora falta calcular la edad.
### Vectores
#### Crear funciones
 
Ahora necesitamos que el usuario nos diga que fecha requiere en el mismo formato de antes, pero ahora no quiero que la fecha este *"hardcodeada"* (Que este dentro del script).

```R
#Pedirle al usuario que escriba algo es facil, vamos a trabajar con la
#funcion readline(), el formato seria algo asi readline(prompt = "Texto que muestra al
#registrar entrada")

Fecha_Destino <- readline(prompt = "Ingresa la fecha destino: ")
```

Okey, ya tenemos la fecha, ahora hay que copiar y pegar todo el codigo que hicimos antes... y remplazar nombres de variables... 

![aaa](img/aaa.gif)

Mejor vamos a hacer una **función** a este punto yo creo que ya intuimos que es una función, su definición en programación es: 

- En programación es un bloque de código diseñado para realizar una tarea específica. Puede procesar datos y devolver un resultado. Las funciones nos permiten dividir un programa en partes más pequeñas y manejables, lo que facilita la comprensión, el mantenimiento y la **reutilización del código**.

Lo que nos interesa es lo que pone en negritas, reutilizar código. Ahora vamos a copiar y pegar nuestro código remplazando variables... lo se, pero esta va a ser la ultima vez que lo hagamos.

```R
#La funcion para hacer funciones se llama function(), en el parentesis, vamos
#a poner todas las variables externas a la funcion que se vayan emplear
#adentro de la funcion
convertir_fecha <- function(Fecha) {
  # Divide la cadena en palabras separadas por espacios
  Fecha_separado <- strsplit(Fecha, " ")
  
  # Extrae el día, mes y año
  Dia <- as.numeric(Fecha_separado[[1]][1])
  Mes <- Fecha_separado[[1]][3]
  Año <- as.numeric(Fecha_separado[[1]][5])
  
  # Convierte el mes a un valor numérico
  Mes <- switch(Mes,
                       "Diciembre" = 12,
                       "Noviembre" = 11,
                       "Octubre" = 10,
                       "Septiembre" = 9,
                       "Agosto" = 8,
                       "Julio" = 7,
                       "Junio" = 6,
                       "Mayo" = 5,
                       "Abril" = 4,
                       "Marzo" = 3,
                       "Febrero" = 2,
                       "Enero" = 1,
                       "default" = NA)
                       
  #Utilizamos c() para crear vectores, en este caso lo vamos a ocupar para
  #regresar los valores de Dia, Mes y Año en una sola variable (resultados)
  
  return(c(Dia, Mes, Año)) # La funcion return(), indica que valores nos va
  # a dar la funcion en general, en este caso la funcion "convertir_fecha"
  # nos va ad dar Dia, Mes Año en un vector
}
#Suponiendo que el usuario nos dio la fecha 13 de Noviembre de 2030  
resultados <- convertir_fecha(Fecha_Destino)
print(resultados)
}
```
{{< alert icon = "code" >}}
{{< typeit >}}
[1]   13   11 2030
{{< /typeit >}}
{{< /alert >}}

*"Resultado"* es un vector, por lo tanto si quisieramos cambiar de clase a uno de sus elementos todo el vector cambiaria.

```R
#Como los vectores son unidimensionales solo hace falta el indice para acceder a un valor

Resultado[1] <- as.character(Resultado[1])

print(class(Resultado[2]))
```
{{< alert icon = "code" >}}
{{< typeit >}}
[1] "character"
{{< /typeit >}}
{{< /alert >}}

Bueno, sabiendo esto podemos hacer la ultima función, para saber que edad tendré en una fecha establecida.

```R
#Vamos a usar una funcion dentro de una funcion, ya lo habiamos hecho antes
#al poner print(class()) o al poner return(c()) pero ahora se hara más #evidente
Conocer_Edad <- function(Mi_cumpleaños, Fecha_Destino){
 
 #Utilizamos la funcion convertir_fecha

 Resultado_cumple <- convertir_fecha(Mi_cumpleaños)
 
 Resultado_Fecha <- convertir_fecha(Fecha_Destino)
 
 #Convertirmos Meses a Dias (Un mes tiene 30.4375 en promedio, esto porque un
 #año tiene 365.25 dias contando el año bisiesto)
 
 Resultado_cumple[2] <- Resultado_cumple[2] * 30.4375
 
 Resultado_Fecha[2] <- Resultado_Fecha[2] * 30.4375
 
 #Convertimos Meses a Años
 
 Resultado_cumple[3] <- Resultado_cumple[3] * 365.25
 
 Resultado_Fecha[3] <- Resultado_Fecha[3] * 365.25
 
 #Ahora sumamos para ver el total de dias, usando sum(), si a sum() le das un  #vector numerico, automaticamente sumara todos los valores dentro del vector
 
 Total_Dias_cumple <- sum(Resultado_cumple)
 
 Total_Dias_Fecha <- sum(Resultado_Fecha)
 
 #Ahora sacamos la diferencia entre los Dias y lo dividimos entre 365.25 para obtener los años
 
 
 Diferencia_Años <- (Total_Dias_Fecha - Total_Dias_cumple)/365.25
 
 #El resultado probablemente sea un numero decimal con punto flotante, asi que podemos usar floor() para redondear el valor hacia abajo
 
 Años_Aproximados <- floor(Diferencia_Años)
 
 return(Años_Aproximados)
}


Edad_Aproximada <- Conocer_Edad(Mi_cumpleaños, Fecha_Destino)

cat("Hola mi nombre es", Mi_nombre, "tengo", Mi_edad, "años, nací el",
    Mi_cumpleaños,"en el", Fecha_Destino , "tendré", Edad_Aproximada,
    "años")

```

{{< alert icon = "code" >}}
{{< typeit >}}
Hola mi nombre es Jorge Alfredo Suazo Victoria tengo 18 años, nací el 30 de Diciembre de 2005 en el 13 de Noviembre de 2030 tendré 24 años
{{< /typeit >}}
{{< /alert >}}

Listo, ahora ya sabes como calcular una edad aproximada en R, te animo a que trates de modificar el código, intentes añadir nuevas funciones, quizás agregar una función que te diga tu signo zodiacal, lo que se te ocurra, cualquier duda mi correo esta en la parte superior de la pagina en forma de arroba :).