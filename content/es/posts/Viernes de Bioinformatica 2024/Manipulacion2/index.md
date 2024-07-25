---
title: "Manipulación de datos con R base (matrix y lista)"
date: 2024-02-16
draft: false
description: "Matriz y lista"
tags: ["Rstudio", "viernes","R"]
showAuthor: false
authors:
 - "evelia"
 - "sofia"
series: ["Viernes de Bioinformatica (2024)"]
series_order: 3
---

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