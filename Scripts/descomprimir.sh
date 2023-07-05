#!/bin/bash

#Validando que la cantidad de argumentos ingresada es 2
if [[ $# -ne 2 ]]
then
	echo "ERROR, debe ingresar dos argumentos"
	exit 1
fi
