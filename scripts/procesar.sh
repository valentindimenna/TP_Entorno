#!/bin/bash
 
DIRECTORIO="datasets/imgs_descomprimidas" #Directorio resultado del script descomprimir.sh
#Validando que el directorio exista. Si no existe es probable que no se haya ejecutado descomprimir.sh
if ! [[ -d "$DIRECTORIO" ]]; then 
	echo "El directorio NO existe. Es probable que aún no se hayan descomprimido (Opcion 2), generado las imágenes(Opcion 1) o ya se hayan procesado las imagenes."
	exit 1
fi

#Bucle que recorre cada imagen perteneciente a datasets/imgs_descomprimidas
for IMAGEN in "$DIRECTORIO"/*; do
	NOMBRE=$(basename $IMAGEN) #Nombre del archivo sin ruta
	if [[ $NOMBRE =~ ^[A-Z][a-z].*\.jpeg$ ]]; then #Comprobando que el nombre sea válido
		echo "$NOMBRE: nombre de archivo válido"
		convert $IMAGEN -gravity center -resize 512x512+0+0 $IMAGEN #Nombre válido entonces se procesa la imagen
	else
		echo "$NOMBRE: nombre de archivo NO valido" #Mensaje de nombre inválido, no cataloga como error
	fi 
done

mv $DIRECTORIO datasets/imgs_procesadas #Renombrando directorio para que el usuario note los cambios

exit 0
