#!/bin/bash

#Validando que la cantidad de argumentos ingresada sea 2
if [[ $# -ne 2 ]]; then
	echo "ERROR, debe ingresar dos argumentos"
	exit 1
fi
#Validando que ambos archivos existan
if [[ ! -f $1 || ! -f $2 ]]; then
	echo "ERROR, uno o ambos archivos no existen en la/s ruta/s ingresada/s"
	exit 2
fi
#Validando que el primero argumento es un archivo con extensión '.tar.gz'
if ! [[ $1 =~ ^.+\.tar.gz$ ]]; then
	echo "ERROR, el primer argumento debe ser un archivo comprimido '.tar.gz'"
	exit 3
fi
#Validando que el segundo argumento es un archivo de texto (donde estará el hash md5 a comparar)
if [[ ! $(file -b $2) == "ASCII text" ]]; then
	echo "ERROR, el segundo argumento debe ser un archivo de texto"
	exit 4
fi

#Comparamos la suma de verificación del segundo argumento con la del archivo del primer argumento
if [[ $(echo $(md5sum $1) | cut -d ' ' -f 1) == $(cat $2) ]]; then
	echo "La suma de verificación proporcionada coincide con la del archivo, se procederá a descomprimir."
	mkdir -p Datasets/imgs_descomprimidas #Se crea un directorio donde se descomprimirá el archivo
	tar -xf Datasets/imgs.tar.gz -C Datasets/imgs_descomprimidas #Descomprimiendo el archivo
else
	echo "La suma de verificación proporcionada NO coincide con la del archivo."
fi

exit 0
