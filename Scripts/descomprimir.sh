#!/bin/bash

#Validando que la cantidad de argumentos ingresada sea 2
if [[ $# -ne 2 ]]; then
	echo "ERROR, debe ingresar dos argumentos"
	exit 1
fi
#Validando que el primero argumento es un archivo regular (el archivo comprimido de las imagenes)
if [[ ! -f $1 ]]; then
	echo "ERROR, el primer argumento debe ser un archivo regular"
	exit 2
fi
#Validando que el segundo argumento es un archivo de texto (donde estará el hash md5 a comparar)
if [[ ! $(file -b $2) == "ASCII text" ]]; then
	echo "ERROR, el segundo argumento debe ser un archivo de texto"
	exit 3
fi
#Comparamos la suma de verificación proporcionada con la del archivo regular pasado como primer argumento
if [[ $(echo $(md5sum $1) | cut -d ' ' -f 1) == $(cat $2) ]]; then
	echo "La suma de verificación proporcionada coincide con la del archivo, se procederá a descomprimir."
	mkdir -p Datasets/imgs_descomprimidas #Se crea un directorio donde se descomprimirá el archivo
	tar -xf Datasets/imgs.tar.gz -C Datasets/imgs_descomprimidas #Descomprimiendo el archivo
else
	echo "La suma de verificación proporcionada NO coincide con la del archivo."
	exit 4
fi

exit 0
