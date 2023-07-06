#!/bin/bash
 
carpeta="../Datasets/imgs"

if [ -z "$(ls  "$carpeta")" ];then 
	echo "La carpeta esta vacia no hay imagenes por procesar"
	exit 1
fi
for imagen in "$carpeta"/*; do
	if echo "$imagen" | grep ^\.\./Datasets/imgs/[A-Z][a-z]*\.jpeg$
		then
		echo "nombre de archivo Valido"
		convert $imagen -gravity center -resize 512x512+0+0 $imagen

	else
		echo "nombre de archivo no valido: "
		nombre_imagen=$(basename $imagen)
		echo "$nombre_imagen"
	fi 
done
exit 0
