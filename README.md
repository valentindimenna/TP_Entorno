# Trabajo Práctico final - Entorno de programación 2023

## ¿Qué hace?

Este proyecto genera un contenedor que al ejecutarse presenta un menú de opciones para descargar, procesar, analizar y comprimir un lote de imágenes.

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
