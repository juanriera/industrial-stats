---
title: Introducción a R
toc-title: Table of contents
---

### Cómo usar este cuaderno

-   Si has abierto un cuaderno ya creado, del que te han pasado un
    enlace, y estás abriéndolo por primera vez, sigue estos pasos:
    1.  Guarda una copia en tu carpeta de Google Drive. Para ello, vete
        a `Archivo/Guardar una copia en Drive` y guárdalo.
    2.  Una vez guardada la copia, puedes cambiar el nombre en
        'Archivo/Cambiar nombre\`
-   Si vas a crear una hoja nueva (en blanco) mediante el enlace a
    Google Colaborate, sigue estos pasos:
    1.  Abre la hoja de Google Colaborate escribiendo en la barra de
        direcciones del navegador: `colab.to/r`
    2.  Guarda una copia en `Archivo/Guardar una copia como`
    3.  Renombra la hoja en `Archivo/Cambiar nombre` usando el nombre
        que quieras

Recordatorio: Para ejecutar una casilla de código, haz click sobre ella.

-   `Shift-Enter`ejecuta el código *y pasa a la siguiente casilla*.
-   `Ctrl-Enter`ejecuta el código *y permanece en la misma casilla*

Recuerda también que las casillas de código deben ejecutarse en orden
secuencial desde el principio

Haciendo click en la barra de opciones a la izquierda sobre la primera
opción de `índice` podemos tener la visión de conjunto del cuaderno

## Primeros pasos

Como hemos visto, R es un lenguaje de programación y un entorno de
desarrollo. Como el entorno original de R es bastante sencillo, se han
desarrollado diferentes interfaces que mejoran el manejo del programa y
facilitan el trabajo.

Las más conocidas son [Rstudio](https://www.rstudio.com/) y el entorno
Jupyter, originalmente desarrollado para Python pero que se ha
convertido en interfase universal de muchos lenguajes de programación.
Entre las diferentes plataformas que utiizan el entorno Jupyter,
nosotros utilizaremos Google Colaborate, conocido como
[Colaboratory](https://colab.research.google.com/) o simplemente, Google
Colab.

En este entorno, podemos escribir código R y ejecutarlo, tal como
indicábamos más arriba:

-   `Shift-Enter` ejecuta el código y pasa a la siguiente casilla.
-   `Ctrl-Enter` ejecuta el código y permanece en la misma casilla

También podemos escribir en celdas de texto, lo que nos permite
intercalar explicaciones a nuestros cálculos o cualquier otro contenido
escrito.

Para editar una celda, no tenemos más que hacer click en ella, si es una
celda de cálculo, o doble click si es de texto.

## Cálculos simples con R

En su forma más básica, R se puede utilizar como una simple calculadora,
utilizando los siguientes operadores aritméticos:

Adición: $+$ (Ejemplo: $2+2$)

Resta: $-$ (Ejemplo: $2-2$)

Multiplicación: $*$ (Ejemplo: $2*2$)

División: $/$ (Ejemplo: $2/2$)

Exponenciación: \^ (Ejemplo: $2$\^$2$)

Prueba a ejecutar las siguientes casillas:

::: cell
``` {.r .cell-code}
5 + 5
```
:::

::: cell
``` {.r .cell-code}
5-5
```
:::

::: cell
``` {.r .cell-code}
3*5
```
:::

::: cell
``` {.r .cell-code}
5 + 5 / 2
```
:::

::: cell
``` {.r .cell-code}
(5 + 5) / 2
```
:::

## Creación y asignación de variables

Un concepto básico en programación (estadística) es el de *variable*.

Una variable permite almacenar un valor (por ejemplo, 4) o un objeto
(por ejemplo, una descripción de función) en R. Más tarde se puede usar
el nombre de esta variable para acceder fácilmente al valor o al objeto
que está almacenado dentro de ella.

Podemos imaginar este concepto como una estantería llena de casillas
vacías, en las cuales podemos colocar diferentes objetos: números,
letras, frases, etc La variable es el espacio que almacena un valor, y
que podemos *llamar* u obtener simplemente escribiendo su nombre.

En R, una variable es un *objeto*. Podemos asignar *valores* a ese
objeto, como si colocásemos libros en nuestra estantería. Esta
asignación se hace siempre con el operador de asignación `<-`, en la
forma

nombre_de_objeto \<- valor

Por ejemplo, asignaremos un valor 4 a una variable que se llame mi_var
con el operador de asignación de la sigueinte forma:

mi_var \<- 4

Recuerda que ahora estamos en una casilla de texto; prueba a hacer la
asignación en la casilla de código a continuación, añadiendo el operador
de asignación y ejecutando la casilla con `Mayus-Intro`:

::: cell
``` {.r .cell-code}
mi_var 4
```
:::

Una vez que asignamos un valor a una variable (un objeto R), R recuerda
su valor hasta que lo cambiemos mediante una nueva asignación, borremos
la variable, o finalicemos nuestra sesión.

Para ver el contenido del objeto(lo que hemos almacenado en `mi_var`),
escribimos el nombre y ejecutamos la casilla:

::: cell
``` {.r .cell-code}
mi_var
```
:::

Los nombres de objetos en R deben cumplir algunas normas; por ejemplo,
\* deben comenzar con una letra, \* solo pueden contener letras,
números, \_ y .

Para facilitar la comprensión del código que escribamos, siempre
buscaremos que los nombres de los objetos sean descriptivos, por lo que
necesitamos una forma de unir varias palabras.

En buena práctica de R se recomienda usar lo que en ingles se llama
*snake_case*, separando las palabras en minúscula con \_ Hay muchas
formas de separar las palabras de una variable:

`i_use_snake_case``<br>`{=html} `otherPeopleUseCamelCase``<br>`{=html}
`some.people.use.periods``<br>`{=html}
`And_aFew.People_RENOUNCEconvention``<br>`{=html}

Usemos un nombre realmente largo para nuestro objeto R:

::: cell
``` {.r .cell-code}
este_es_un_nombre_realmente_largo <- 5.3
```
:::

Ahora recuperemos el valor que hemos almacenado

::: cell
``` {.r .cell-code}
este_es_un_nombre_realmente_largo
```
:::

Recuerda que R utiliza la escritura anglosajona para la separación de
decimales, usando un punto, y no una coma como en España. ¿Qué pasaría
si utilizamos una coma para separar los decimales?

::: cell
``` {.r .cell-code}
mi_var <- 2,5
```
:::

R nos avisa de que hay un error en la asignación, error que nosotros
debemos encontrar y corregir.

Otra cuestión básica muy importante es que para R las mayúsculas y
minúsculas son diferentes: `mi_var` y `mi_Var` son objetos diferentes.

En un objeto R podemos almacenar también texto:

::: cell
``` {.r .cell-code}
nombre <- "Esto es una frase 12345"
```
:::

R almacena esta *cadena alfanumérica* exactamente igual que antes hizo
con los valores numéricos:

::: cell
``` {.r .cell-code}
nombre
```
:::

COmo vemos, para almacenar una *cadena alfanumérica* necesitamos
encerrarla entre comillas. De hecho, si almacenamos un número entre
comillas, R no sabrá que es un número, pensará que es un texto:

::: cell
``` {.r .cell-code}
mi_var <- "123.45"
```
:::

::: cell
``` {.r .cell-code}
mi_var
```
:::

Si te has dado cuenta, R permite **reutilizar** los objetos simplemente
reasignándoles el valor correspondiente. Al hacerlo, perdemos el valor
original y lo sustituimos por el nuevo valor.

Hay que tener atención con las reglas de escritura: para asignar un
texto a un objeto debemos tener cuidado de *cerrar* las comillas, si no
lo hacemos, R pensará que estamos todavía escribiendo texto, y nos
muestra el signo `+`para indicarnos que continúa esperando *más* texto:

::: cell
``` {.r .cell-code}
nombre <- "Esto es una cadena alfanumerica que no hemos cerrado
```
:::

### Algunos ejercicios

Intenta detectar los errores en las siguientes casillas de código:

::: cell
``` {.r .cell-code}
mi_variable <- 10
mi_varıable
```
:::

::: cell
``` {.r .cell-code}
mi_var <- 5
Mi_Var
```
:::

Podemos asignar un objeto a otro objeto con el operador de asignación:

::: cell
``` {.r .cell-code}
x <- 5
y <- 3
```
:::

::: cell
``` {.r .cell-code}
x + y
```
:::

::: cell
``` {.r .cell-code}
y <- x
```
:::

::: cell
``` {.r .cell-code}
x + y
```
:::

Supongamos que tenemos 5 peras y 4 manzanas. Crea una variable que se
llame `fruta` que sume el total de unidades de fruta que tenemos,
insertando debajo de esta casilla todas las casillas de código que
necesites (Pista: ¡En R sí podemos sumar `peras` con `manzanas`!)

## Los tipos de datos

Hemos visto que R puede trabajar con diferentes tipos de datos, tales
como números y textos.

Los valores decimales como 4.5 se llaman **numéricos**. Los números
enteros como 4 se llaman **enteros**. Los enteros también son numéricos.
Los valores booleanos (VERDADERO o FALSO) se denominan **lógicos**. Los
valores de texto (o cadena alfanumérica) se denominan **caracteres**.
También se les llama simplemente **cadena**. Las comillas en el editor
indican que "un texto entre comillas" es una *cadena de caracteres*.

Algunos ejemplos:

::: cell
``` {.r .cell-code}
mi_var_numero <- 4.5
mi_var_texto <- "esto es un texto"
mi_var_logica <- FALSE
```
:::

Las variables **lógicas** pueden tomar los valores `TRUE` o `FALSE`. R
responde también con un valor lógico cuando hacemos una *evaluación
lógica*. Por ejemplo,

::: cell
``` {.r .cell-code}
mi_var_numero == 4.5
```
:::

ATENCION: el operador lógico que prueba ua igualdad es `==`, un doble
igual, y no un `=`, un igual sencillo. el operador `=` en R es un
operador de asignación como `<-`, y que se ha mantenido por
compatibilidad con otros lenguajes; en buenas prácticas, se prefiere el
operador de asignación formado por `<-`

veamos otros dos ejemplos que proporcionan una respuesta de valor
lógico:

::: cell
``` {.r .cell-code}
mi_var_numero == 10
```
:::

::: cell
``` {.r .cell-code}
mi_var_numero > 5
```
:::

::: cell
``` {.r .cell-code}
mi_var_numero != 5 # el operador != significa "no es igual a"
```
:::

Una forma de encontrar la estructura de nuestros datos en R es utilizar
la función `str()` (más adelante veremos qué es una *función* en R) :

::: cell
``` {.r .cell-code}
str(mi_var_numero)
```
:::

::: cell
``` {.r .cell-code}
str(mi_var_texto)
```
:::

## Vectores

Un vector es el tipo más simple de estructura de datos en R. El manual
de R define un vector como "una entidad única que consta de una
colección de cosas". Una colección de números, por ejemplo, es un vector
numérico; los primeros cinco números enteros forman un vector numérico
de longitud 5. ... También puedes construir un vector utilizando
diversos operadores.

R es un lenguaje orientado al cálculo con vectores, se dice que R
utiliza *cálculo vectorial*. Esto no se refiere a la forma de calculo
vectorial que se estudia en física, sino a que cuando realizamos una
operación matemática sobre un vector, R aplica el cálculo a todos los
elementos del vector mediante un sistema de *programación vectorial*, lo
que hace que el cálculo sea muy rápido, y la expresión es muy sencilla y
legible. Comparando con una hoja de cálculo, en vez de aplicar el
cálculo a toda una columna copiando y pegando una fórmula, aplicamos la
fórmula al nombre del objeto y R realiza el cálculo para todos los
elementos.

Veamos algunos ejemplos. en primer lugar, crearemos un vector utilizando
la función `c()` (*compose*), que es la forma más sencilla de crear
manualmente un vector en R:

::: cell
``` {.r .cell-code}
mi_vector <- c(1,2,3,4,5,6)
```
:::

Recuperemos los valores:

::: cell
``` {.r .cell-code}
mi_vector
```
:::

Ahora hagamos un cálculo sobre el vector

::: cell
``` {.r .cell-code}
mi_vector * 5
```
:::

Vemos cómo R ha realizado el cálculo de multiplicar por 5 para todos los
elementos del vector. Podemos guardar estos cálculos en otro objeto R o
incluso en el mismo, el cálculo sustituirá los valores originales:

::: cell
``` {.r .cell-code}
mi_vector <- mi_vector * 5
mi_vector
```
:::

## Scripts

En R llamamos un *script* a un conjunto de instrucciones que se ejecutan
juntas; equivale a lo que en otros lenguajes de programación se llama un
*programa*.

Por ejemplo, podríamos hacer un *script* con las instrucciones que hemos
realizado hasta ahora de forma individual:

::: cell
``` {.r .cell-code}
mi_var_numero <- 4.5
mi_vector <- c(1,2,3,4,5,6)
mi_vector <- mi_vector * 5
mi_vector <- mi_vector / mi_var_numero
mi_vector
```
:::

## Funciones en R

Una función en R es un conjunto de instrucciones, escritas en R o en
otro lenguaje de programación que se puede llamar desde R y que realiza
una secuencia de acciones para darnos un resultado. Por ejemplo, `str()`
es una función que nos presenta la estructura de un objeto; otras
funciones pueden realizar cálculos de todo tipo o incluso gráficos.
veamos ejemplos:

::: cell
``` {.r .cell-code}
str(mi_var_numero)
```
:::

::: cell
``` {.r .cell-code}
str(mi_vector)
```
:::

::: cell
``` {.r .cell-code}
mean(mi_vector)
```
:::

::: cell
``` {.r .cell-code}
plot(mi_vector)
```
:::

Más adelante iremos viendo muchos ejemplos de funciones útiles. R es un
lenguaje de programación que se diseñó para ser extensible: aunque R
básico incorpora muchas funciones, los miles de usuarios de R han
desarrollado miles de funciones que realizan cálculos y gráficos de todo
tipo, desde usos estadísticos hasta cálculos financieros, tratamiento de
datos, análisis sintáctico, aprendizaje automático, etc. La gran riqueza
de funciones disponibles en R es una de sus mayores fortalezas; además,
estas funciones son permanentemente revisadas por los usuarios, con lo
que sus resultados tienen la garantía de estar al día en métodos de
cálculo, precisión, etc. De hecho, muchos de los algoritmos de cálculo y
estadísticos utilizados en estadística y ciencia de datos se prueban en
R antes de su publicación en revistas especializadas.

Las funciones desarrolladas por otros usuarios se incluyen en las
llamadas **librerías**; para utilizarlas, estas librerías se cargan en
el entorno de R mediante la función `library()`. Veremos el uso de
algunas de las principales librerías más adelante.

## El *data frame*

El marco de datos o *data frame* es el objeto R más útil y más usado en
el análisis de datos. Consiste en una estructura de dos dimensiones,
formada por una serie de vectores de igual longitud, igual que una tabla
de una hoja de cálculo, en la que cada columna es una variable y cada
fila, un caso, observación o individuo. R incluye varios *data frames*
de muestra en el paquete de base, que son útiles para entender cómo
están formados. Veamos uno de ellos, el famoso conjunto de datos
[**iris**](https://es.wikipedia.org/wiki/Conjunto_de_datos_flor_iris) de
[Ronald Fisher](https://es.wikipedia.org/wiki/Ronald_Fisher), que
contiene un conjunto de medidas realizadas sobre flores del género
*Iris* realizadas por este investigador en los años 30 del siglo XX.

::: cell
``` {.r .cell-code}
head(iris)
```
:::

La función `head()` es útil para presentarnos sólo el *encabezado* del
*data frame*. Veamos la estructura de este *data frame*:

::: cell
``` {.r .cell-code}
str(iris)
```
:::

Para utilizar una variable de un *dataframe*, es necesario decir a R que
pertenece a ese *dataframe*, si no lo hacemos así no reconocerá el
nombre. Para ello indicaremos el nombre del *dataframe* y el de la
variable separándolos con el signo dólar `$`

::: cell
``` {.r .cell-code}
Sepal.Length
```
:::

::: cell
``` {.r .cell-code}
iris$Petal.Length
```
:::

De la misma forma podemos aplicar cualquier función a una variable de un
*dataframe*:

::: cell
``` {.r .cell-code}
mean(iris$Petal.Length)
```
:::

## Introducir datos en R

Una vez que conocemos las principales estructuras de datos de R,
necesitamos saber cómo introducir nuestros datos para analizarlos. R en
general no es muy flexible para la introducción de datos; no hay
herramienta que se pueda comparar en flexibilidad a una hoja de cálculo.
Por esta razón, en nuestros ejemplos a aprtir de aquí trabajaremos con
datos que previamente se han introducido en una hoja de cálculo, ya sea
Microsoft Excel o Google Sheets. Esto no quiere decir que no se puedan
introducir datos en el propio programa, antes hemos visto cómo crear un
vector; hay formas sencillas de crear un *data frame* a partir de varios
vectores Por el momento, nos limitaremos a hacer nuestros cálculos
recuperando hojas de cálculo.

## Cómo leer una hoja de cálculo en Google Colaborate

### Opción 1: Subir los datos al espacio de trabajo de Google Colaborate

Los pasos son los mismos tanto si queremos trabajar con un `CSV`o
directamente con una hoja Excel: 1. Seleccionamos el icono de carpeta a
la izquierda, que nos abre la barra lateral de `Archivos` 2. Hacemos
click sobre el icono de la hoja con la flecha vertical, lo que nos abre
una ventana de selección de archivos. 3. Seleccionamos la hoja de
cálculo o `CSV`con la que vamos a trabajar y la subimos al espacio de
trabajo de Google Colaborate

Una vez la hoja de cálculo o el `CSV` en nuestro espacio de trabajo,
procedemos a leer los datos como de ordinario.

Antes, podemos verificar los archivos en el espacio de trabajo:

::: cell
``` {.r .cell-code}
list.files()
```
:::

Leemos los datos:

::: cell
``` {.r .cell-code}
library(readxl)
df <- read_excel("ejemplo_muestreo.xlsx", sheet = "Hoja1")
```
:::

Si no hemos cargado la hoja Excel referenciada en la función, el
resultado es un error, y también la visualización del *dataframe*, ya
que no lo hemos cargado con éxito. Si lo tenemos en memoria, podemos
visualizarlo.

::: cell
``` {.r .cell-code}
df
```
:::

El mayor inconveniente de esta forma de trabajo es que cada vez que
salimos de la sesión, Google Colab borra todos nuestros archivos del
espacio de trabajo; cada vez que iniciemos una sesión, tendremos que
repetir el proceso de subir nuestros datos al espacio de trabajo.

### Opción 2: Leer directamente los datos de nuestra carpeta de Google Drive

Esta es una opción mucho más cómoda que nos evita los pasos intermedios,
ya que no necesitamos subir la hoja de cálculo al espacio de trabajo.

Supongamos que hemos guardado nuestros datos en una hoja de cálculo como
ésta:

<https://docs.google.com/spreadsheets/d/1jXn9X3GU7iXOqc0JdKoYyKz4mcHghpT3h8nlvjea_Cg/edit?usp=sharing>

Vamos a usar la librería `googlesheets4` para acceder a nuestra hoja de
Google Sheets. Para que podamos leer una hoja de nuestra carpeta,
necesitamos que Drive nos proporcione un *token* identificativo de
seguridad.

Como no vamos a guardar datos desde Google Colaborate en nuestra carpeta
de Google Drive, sólo necesitamos permisos de lectura, no necesitamos
identificarnos como autores. Por esta razón, utilizamos la función
`gs4_deauth()` para decir a Drive que no nos solicite credenciales de
autor y contraseña:

::: cell
``` {.r .cell-code}
library(googlesheets4) # cargamos la librería que hemos instalado al principio para acceder a sus funciones
gs4_deauth()
```
:::

Para obtener el *token*, nos situamos en nuestra carpeta de Google Drive
y abrimos la hoja. Google nos presenta en la parte superior de la
ventana la posibilidad de **compartir** la hoja.

Hacemos click en esta opción y seleccionamos en la parte inferior
`Cualquier persona con el enlace`. Drive nos proporciona un enlace a la
hoja, que copiamos y pegamos en nuestra función de lectura
`read_sheet()` de la biblioteca `googlesheets4`.

Una vez pegado, podemos acceder a los datos:

::: {.cell executionInfo="{\"status\":\"ok\",\"timestamp\":1716798206147,\"user_tz\":-120,\"elapsed\":1617,\"user\":{\"displayName\":\"Juan Riera\",\"userId\":\"13936244033390161607\"}}" outputId="d1e73f7a-41d9-4bba-8528-9cfaf76ba02d"}
``` {.r .cell-code}
df <- read_sheet("https://docs.google.com/spreadsheets/d/1jXn9X3GU7iXOqc0JdKoYyKz4mcHghpT3h8nlvjea_Cg/edit?usp=sharing") # obtener el token de Google Drive
```

::: {.cell-output .cell-output-stderr}
    ✔ Reading from camembert.

    ✔ Range BD.
:::
:::

La hoja de datos nos muestra la serie de análisis de producto terminado
de un año de fabricación de camembert. La función anterior nos ha leído
la tabla de valores en un objeto *data frame* de R.

Veamos los primeros valores de nuestro *data frame*, utilizando la
función `head()`, igual que hemos hecho antes:

::: {.cell executionInfo="{\"status\":\"ok\",\"timestamp\":1716798223160,\"user_tz\":-120,\"elapsed\":277,\"user\":{\"displayName\":\"Juan Riera\",\"userId\":\"13936244033390161607\"}}" outputId="978e65e2-b915-4393-aae7-10a026ac35a9"}
``` {.r .cell-code}
head(df)
```

::: {.cell-output .cell-output-display .cell-output-markdown}
A tibble: 6 × 7

-----------------------------------------------------------------------------------
  fecha        fabricacion   est        mg \<dbl\> ph \<dbl\> cloruros   coliformes
  \<dttm\>     \<dbl\>       \<dbl\>                          \<dbl\>    \<dbl\>
------------ ------------- ---------- ---------- ---------- ---------- ------------
  2020-01-11   1             46.68      24.0       4.85       1.50       80

  2020-01-12   1             48.09      25.0       4.67       1.61       0

  2020-01-13   1             45.97      24.0       4.71       1.48       9200

  2020-01-14   1             46.24      23.5       4.78       1.69       20

  2020-01-15   1             45.81      23.0       4.77       1.56       150

  2020-01-18   1             46.00      24.0       4.67       1.56       60
  -----------------------------------------------------------------------------------
:::
:::

## Resumen

En esta charla hemos tomado contacto con R y su utilización a través de
un interface Jupyter, en este caso **Google Colaborate**. Hemos visto
los principales tipos de datos de R, particularmente el *data frame*, y
hemos aprendido a leer datos que previamente se habían introducido en
una hoja de cálculo. Ya estamos listos para empezar a utilizar R en el
análisis de nuestros datos de producción.

### Enlaces

[Quarto – Tutorial: Hello, Quarto](https://quarto.org/docs/get-started/hello/jupyter.html)

[Making sharable documents with Quarto - Making shareable documents with Quarto (openscapes.github.io)](https://openscapes.github.io/quarto-website-tutorial/)

[Openscapes Champions Series - Openscapes Champions Lesson Series](https://openscapes.github.io/series/)

[Openscapes Champions Series - Data strategies for future us](https://openscapes.github.io/series/core-lessons/data-strategies.html)

[jtleek/datasharing: The Leek group guide to data sharing (github.com)](https://github.com/jtleek/datasharing)

