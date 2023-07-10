#!/bin/bash
opciones="Generar Descomprimir Procesar Comprimir Salir"
PS3="Elija una opcion: "
select opcion in $opciones
do
	case $opcion in 
		Generar)
			echo "--------------------------------------------"
			echo "$opcion"
			echo -n "Ingrese cantidad de imágenes a generar: "; read CANTIDAD
			bash scripts/generar.sh $CANTIDAD
			;;
		Descomprimir)
			echo "--------------------------------------------"
			echo "$opcion"
			#echo -n "Ingrese archivo con las imágenes comprimidas: "; read ARCH
			#echo -n "Ingrese archivo con suma de verificación: "; read SUMA
			ARCH=datasets/imgs.tar.gz
			SUMA=datasets/imgs.tar.gz.sum
			bash scripts/descomprimir.sh $ARCH $SUMA
			;;
		Procesar)
			echo "--------------------------------------------"
			echo "$opcion"
			bash scripts/procesar.sh
			;;
		Comprimir)
			echo "--------------------------------------------"
			echo "$opcion"
			bash scripts/comprimir.sh
			;;
		Salir)
			echo "--------------------------------------------"
			echo "$opcion"
			break
			;;
	esac

done
exit 0
