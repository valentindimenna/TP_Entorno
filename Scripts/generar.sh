#!/bin/bash

#Validando que la cantidad de argumentos ingresada es 1
if [[ $# -ne 1 ]]
then
	echo "ERROR, debe ingresar un único argumento"
	exit 1
fi
#Validando que el argumento ingresado sea un número entero positivo
if ! [[ $1 =~ ^[0-9]+$ && $1 -gt 0 ]]
then
	echo "ERROR, debe ingresar un número entero positivo como argumento"
	exit 2
fi

#Bucle que genera la cantidad de imagenes pasadas por argumento. Se guardarán dentro de ../Datasets/imgs
for ((i=1; i<=$1; i++))
do	 
	nombre=$(sed -n "$RANDOM p" ../Datasets/nombres) #Eligiendo nombre random
	#echo $nombre
	nombre=$(echo $nombre | cut -d ',' -f 1) #Modificando nombre para que sea adecuado
	nombre=$(echo $nombre | tr -d ' ') #Quitando espacios dentro del nombre para que sea adecuado
	#echo $nombre
	wget https://thispersondoesnotexist.com/ -O "../Datasets/imgs/$nombre.jpeg" #Generando imagen random
	sleep 1
done

#Compresión
gzip -r ../Datasets/imgs

#Generando md5sum de cada imagen comprimida
for imagen in $(find ../Datasets/imgs -type f)
do
	md5sum $imagen > ../Datasets/imgs/$(basename $imagen).sum #Generando archivo sum
done

exit 0
