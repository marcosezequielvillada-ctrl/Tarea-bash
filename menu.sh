#!/bin/bash

if [[ "$1" == "-d" ]]; then
   pkill -f consolidar.sh
   rm -r $HOME/Tarea-bash/EPNro1
   echo "Entorno borrado"
   exit
fi

while true
do
  echo "1) Crear entorno"
  echo "2) Correr Proceso"
  echo "3) Mostrar listado"
  echo "4) Mostrar 10 notas"
  echo "5) Solicitar Informacion"
  echo "6) Visualizar Log"
  echo "7) Salir"
  echo "==============================="
  echo -n  "Elegi una opcion: "
  read opcion
  echo ""

  case $opcion in
      1)
        mkdir -p $HOME/Tarea-bash/EPNro1/entrada $HOME/Tarea-bash/EPNro1/salida $HOME/Tarea-bash/EPNro1/procesado
        echo "Entorno creado"
        ;;
      2)
        $HOME/Tarea-bash/EPNro1/consolidar.sh &
        echo "Proceso corriendo en segundo plano"
        ;;   
      3)
        if [[ -f "$HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
           sort -k1 -n $HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt
        else
           echo "el archivo no existe"
        fi
        ;;
      4)
        if [[ -f "$HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
           sort -k5 -n -r $HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt | head -10
        else
           echo "el archivo no existe"
        fi
        ;;
      5)
        if [[ -f "$HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
           echo "ingrese numero de padron: "
           read padron
           grep "$padron" $HOME/Tarea-bash/EPNro1/salida/$FILENAME.txt
        else
           echo "el archivo no existe"
        fi 
      ;;
      6)
        cat $HOME/Tarea-bash/EPNro1/procesado.log
      ;;
      7)
        echo "Saliendo del menu"
        exit 0
        ;;
      *)
        echo "Opcion invalida"
        ;;
  esac
done


