#!/bin/bash

clear
if [ "$#" -ne 1 ]; then                                                                                                                           
   echo "Incorect use: ./script.sh <folder path>"
   exit 1
 fi

function print(){
  Colunas=`tput cols`
  Linhas=`tput lines`
  Linha=$((Linhas / 2)) # Qual é a linha central da tela? 
  Coluna=$(((Colunas - ${#P}) / 2))
  tput sc #Salva a posicao do cursor 
  tput cup $Linha $Coluna # Posiciona o cursor antes de escrever
  tput rev # Grava a string na saida padrão
  echo $P
  tput sgr0
  tput rc # Devolve o cursor à posição original
}

arquivo="$1"
while IFS= read -r P || [[ -n "$P" ]]; do
        echo $P 
        print "$P"
done < "$arquivo"

