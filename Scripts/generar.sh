#!/bin/bash

for ((i=1; i<=$1; i++))

do	 
	nombre=$(sed -n "$RANDOM p" ../Datasets/nombres)
	echo $nombre
	nombre=$(echo $nombre | cut -d ',' -f 1)
	nombre=$(echo $nombre | tr -d ' ')
	echo $nombre
	wget https://thispersondoesnotexist.com/ -O "../Datasets/imgs/$nombre.jpeg" 
	md5sum "../Datasets/imgs/$nombre.jpeg" > "../Datasets/imgs/$nombre.jpeg.sum"
	sleep 1
done
