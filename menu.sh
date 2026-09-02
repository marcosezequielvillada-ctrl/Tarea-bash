#!/bin/bash

if [[ "$1" == "-d" ]]; then
   pkill -f consolidar.sh
   rm -r $HOME/tarea-bash/EPNro1
   echo "Entorno borrado"
   exit
fi

echo "1) Crear entorno"
echo "2) Correr Proceso"
echo "3) Mostrar listado"
echo "4) Mostrar 10 notas"
echo "5) Solicitar Informacion"
echo "6) Visualizar Log"
echo "7) Salir"

read opcion

case $opcion in
    1)
      mkdir -p $HOME/tarea-bash/EPNro1/entrada $HOME/tarea-bash/EPNro1/salida $HOME/tarea-bash/EPNro1/procesado
      ;;
    2)
      $HOME/tarea-bash/EPNro1/consolidar.sh &
      ;;   
    3)
      if [[ -f "$HOME/tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
         sort -k1 -n $HOME/tarea-bash/EPNro1/salida/$FILENAME.txt
      else
          echo "el archivo no existe"
      fi
      ;;
    4)
      if [[ -f "$HOME/tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
         sort -k5 -n -r $HOME/tarea-bash/EPNro1/salida/$FILENAME.txt | head -10
      else
         echo "el archivo no existe"
      fi
      ;;
    5)
      if [[ -f "$HOME/tarea-bash/EPNro1/salida/$FILENAME.txt" ]]; then
         echo "ingrese numero de padron: "
         read padron
         grep "$padron" $HOME/tarea-bash/EPNro1/salida/$FILENAME.txt
      else
         echo "el archivo no existe"
      fi 
      ;;
    6)
      cat $HOME/tarea-bash/EPNro1/procesado.log
      ;;
    7)
      echo "Saliendo del menu"
      exit
      ;;
    *)
      echo "Opcion invalida"
      ;;
esac



