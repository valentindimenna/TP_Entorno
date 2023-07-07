#!/bin/bash
 
DIRECTORIO="Datasets/imgs_descomprimidas" #Directorio resultado del script descomprimir.sh
#Validando que el directorio exista. Si no existe es probable que no se haya ejecutado descomprimir.sh
if ! [[ -d "$DIRECTORIO" ]]; then 
	echo "El directorio NO existe. Debes generar y descomprimir las imágenes previo al uso de este script"
	exit 1
fi
#Validando que el directorio no esté vacío. Si lo está, es probable que el número de imágenes generadas sea 0
if [[ -z "$(ls "$DIRECTORIO")" ]]; then 
	echo "El directorio está vacío. Debes generar y descomprimir las imágenes previo al uso de este script"
	exit 2
fi
#Bucle que recorre cada imagen perteneciente a Datasets/imgs_descomprimidas
for IMAGEN in "$DIRECTORIO"/*; do
	NOMBRE=$(basename $IMAGEN) #Nombre del archivo sin ruta
	if [[ $NOMBRE =~ ^[A-Z][a-z].*\.jpeg$ ]]; then #Comprobando que el nombre sea válido
		echo "$NOMBRE: nombre de archivo válido"
		convert $IMAGEN -gravity center -resize 512x512+0+0 $IMAGEN #Nombre válido entonces se procesa la imagen
	else
		echo "$NOMBRE: nombre de archivo NO valido" #Mensaje de nombre inválido, no cataloga como error
	fi 
done

exit 0
