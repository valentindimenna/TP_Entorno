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
			bash scripts/descomprimir.sh datasets/imgs.tar.gz datasets/imgs.tar.gz.sum
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
