#!/bin/bash
while true
do
  cd "$HOME/tarea-bash/EPNro1/entrada"
  for archivo in *.txt
  do
    if [[ -f "$archivo" ]]; then
       cat "$archivo" >> "$HOME/tarea-bash/EPNro1/salida/$FILENAME.txt"
       mv $archivo $HOME/tarea-bash/EPNro1/procesado/
       echo "$(date +"%d/%m/%Y %H:%M:%S") - Procesado archivo $archivo" >> "$HOME/tarea-bash/EPNro1/procesado.log"
    fi
  done
  sleep 5
done
