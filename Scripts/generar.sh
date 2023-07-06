#!/bin/bash

#Validando que la cantidad de argumentos ingresada sea 1
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

#Bucle que genera la cantidad de imagenes pasadas por argumento. Se guardarán dentro de Datasets/imgs
for ((i=1; i<=$1; i++))
do	 
	NOMBRE=$(sed -n "$RANDOM p" Datasets/nombres) #Eligiendo nombre random
	NOMBRE=$(echo $NOMBRE | cut -d ',' -f 1) #Modificando el nombre para que sea adecuado
	NOMBRE=$(echo $NOMBRE | tr -d ' ') #Quitando espacios dentro del nombre para que sea adecuado
	wget https://thispersondoesnotexist.com/ -O "Datasets/imgs/$NOMBRE.jpeg" #Generando imagen random
	sleep 1
done

#Compresión
tar -czf Datasets/imgs.tar.gz -C Datasets/imgs $(ls Datasets/imgs)

#Generando md5sum del archivo comprimido
echo $(md5sum  Datasets/imgs.tar.gz) | cut -d ' ' -f 1  > Datasets/imgs.tar.gz.sum

exit 0
