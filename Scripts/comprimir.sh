#!/bin/bash

carpeta="../Datasets/imgs"

touch ../Datasets/img_nombre_imagenes.txt
touch ../Datasets/img_nombre_imagenes_validas.txt
touch ../Datasets/img_termina_a.txt
total_a=0
for imagen in "$carpeta"/*; do
	if echo "$imagen" | grep -q "\.sum$";
		then 
		echo "no es una imagen $(basename $imagen)"
		
	elif 	echo "$imagen" | grep -q ^\.\./Datasets/imgs/[A-Z][a-z]*\.jpeg$
		then 
		#echo "imagen tiene nombre Valido"
		nombre=$(basename $imagen)
		#echo "$nombre"
		echo "$nombre">> ../Datasets/img_nombre_imagenes_validas.txt
		echo "$nombre">> ../Datasets/img_nombre_imagenes.txt
		
		if echo "$nombre" | grep -q ^[^/]*[aA]\.jpeg$ ; #verifico si el nombre de la imagen termina en 'a' o 'A'
			then 
			#echo "nombre termina en a/A $nombre"
			total_a=$((total_a + 1))
		fi
		
	else
		nombre=$(basename $imagen)
		echo "$nombre">> ../Datasets/img_nombre_imagenes.txt
		
		if echo "$nombre" | grep -q ^[^/]*[aA]\.jpeg$ ; #verifico si el nombre de la imagen termina en 'a'
			then 
			#echo "nombre termina en a/A $nombre"
			total_a=$((total_a + 1))
		fi
	fi

done
echo "$total_a">../Datasets/img_termina_a.txt
exit 0
