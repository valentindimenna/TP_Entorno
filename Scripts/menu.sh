#!/bin/bash
opciones="Generar Comprimir Procesar Descomprimir Salir"
PS3="Elija una opcion: "
select opcion in $opciones
do
	case $opcion in 
		Generar)
		
			echo "$opcion\n"
			bash generar.sh
			;;
		Comprimir)
		
			echo "$opcion\n"
			bash comprimir.sh
			;;
		Procesar)
		
			echo "$opcion\n"
			bash procesar.sh
			;;
		Descomprimir)
		
			echo "$opcion\n"
			bash descomprimir.sh
			;;
		Salir)
			echo "$opcion"
			break
			;;
	esac

done
exit 0
