#!/bin/bash

nombre_archivo=$1
echo "$nombre_archivo"

if echo "$nombre_archivo" | grep ^[A-Z][a-z]*\.jpeg$
then
	echo "nombre de archivo Valido"
	convert Datasets/imgs/$nombre_archivo -gravity center -resize 512x512+0+0 Datasets/imgs/$nombre_archivo

else
	echo "nombre de archivo no valido"
fi 
