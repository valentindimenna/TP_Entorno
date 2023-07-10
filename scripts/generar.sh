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

mkdir -p datasets/imgs #Directorio donde se guardarán las imágenes
#Bucle que genera la cantidad de imagenes pasadas por argumento. Se guardarán dentro de datasets/imgs
for ((i=1; i<=$1; i++)); do	 
	NOMBRE=$(sed -n "$RANDOM p" datasets/nombres) #Eligiendo nombre random
	NOMBRE=$(echo $NOMBRE | cut -d ',' -f 1) #Modificando el nombre para que sea adecuado
	NOMBRE=$(echo $NOMBRE | tr -d ' ') #Quitando espacios dentro del nombre para que sea adecuado
	wget https://thispersondoesnotexist.com/ -O "datasets/imgs/$NOMBRE.jpeg" #Generando imagen random
	sleep 1
done

#Compresión
tar -czf datasets/imgs.tar.gz -C datasets/imgs $(ls datasets/imgs)
rm -r datasets/imgs #Borrando directorio sin comprimir

#Generando md5sum del archivo comprimido
echo $(md5sum  datasets/imgs.tar.gz) | cut -d ' ' -f 1  > datasets/imgs.tar.gz.sum

exit 0
