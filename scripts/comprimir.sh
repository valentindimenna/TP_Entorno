#!/bin/bash

DIRECTORIO="datasets/imgs_procesadas"
#Validando que el directorio exista. Si no existe es probable que no se haya ejecutado procesar.sh
if ! [[ -d "$DIRECTORIO" ]]; then
	echo "El directorio NO existe. Es probable que las imagenes no hayan sido procesadas previamente."
	exit 1
fi

touch datasets/nombres_imagenes.txt #Archivo con lista de nombres de las imágenes
touch datasets/nombres_imagenes_validos.txt #Archivo con lista de nombres válidos
touch datasets/nombres_imagenes_a.txt #Archivo con total de personas cuyo nombre termina con 'a'

TOTAL_A=0 #Contador de nombres terminados en 'a' inicializado en 0
#Bucle que recorre cada imagen perteneciente a datasets/imgs_procesadas
for IMAGEN in "$DIRECTORIO"/*; do 
	NOMBRE=$(basename $IMAGEN) #Nombre del archivo sin ruta
	echo "$NOMBRE">> datasets/nombres_imagenes.txt #Guardando nombre en lista de nombres de las imágenes
	#Chequeando si el nombre es válido. En caso de ser verdadero, se guarda en la lista de nombres válidos
	if [[ $NOMBRE =~ ^[A-Z][a-z].*\.jpeg$ ]]; then
		echo "$NOMBRE">> datasets/nombres_imagenes_validos.txt
	fi
#Verificando si el nombre de la imagen termina en 'a' o 'A'. Si es verdadero, se suma 1 al contador TOTAL_A
	if echo "$NOMBRE" | grep -q ^[^/]*[aA]\.jpeg$; then 
		TOTAL_A=$((TOTAL_A + 1))
	fi
done

echo "$TOTAL_A" > datasets/nombres_imagenes_a.txt #Imprimiendo el resultado del contador en su archivo

#Generando archivo comprimido con todos los archivos del trabajo
tar -czf datasets/archivos_comprimidos.tar.gz -C datasets nombres_imagenes_validos.txt nombres_imagenes.txt nombres_imagenes_a.txt imgs_procesadas

rm datasets/nombres_imagenes_validos.txt datasets/nombres_imagenes.txt datasets/nombres_imagenes_a.txt
rm -r $DIRECTORIO

exit 0
