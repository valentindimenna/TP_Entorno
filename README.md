# Trabajo Práctico final - Entorno de programación 2023

## ¿Qué hace?

Este proyecto genera un contenedor que al ejecutarse presenta un menú de opciones para descargar, procesar, analizar y comprimir un lote de imágenes.

### menu.sh 
Muestra un menu de 5 opciones y llama a una funcion especifica segun la opcion elegida

### generar.sh
Descarga una cantidad de imagenes elegida por el usuario, les da un nombre aleatorio sacado de un archivo y deja las imagenes en un archivo comprimido y crea un archivo con su suma de verificación

### descomprimir.sh 
Recibe el archivo comprimido con las imagenes y otro con su suma de verificacion, si no ocurrio ningun problema, descomprime el archivo

### procesar.sh
Recibe el archivo con las imagenes y a las que tienen un nombre valido (Empiezan con mayuscula y siguen en minusculas ej: Juan.jpeg) las recortamos a 512*512

### comprimir.sh 
genera 3 archivos, uno con la lista de nombres de todas las imágenes otro con la lista de nombres válidos y el ultimo con el total de personas cuyo nombre finaliza con la letra a. Por ultimo genera un archivo comprimido con los 3 archivos creados anteriormente y todas las imagenes

## ¿Cómo ejecutarlo?

_Primero se debe instalar la imágen de docker en la que trabajaremos:_
```
docker build -t tp_entorno .
```
_Luego, para correr el docker basta con utilizar el script ejecutar.sh:_
```
bash ejecutar.sh
```
### Una vez dentro del docker...

_El docker se iniciará con el siguiente menú de opciones:_
```
1) Generar
2) Descomprimir
3) Procesar
4) Comprimir
5) Salir
Elija una opcion:
```
Lo recomendado es que siga el orden de los items para que el programa funcione correctamente.

## Autores:
* **Alva Máximo**
* **Dimenna Valentín**
