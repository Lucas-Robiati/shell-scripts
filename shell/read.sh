#!/bin/bash

read -sp "Digite uma senha: " S
echo -e "\n$S"

read -n11 -p "Digite seu CPF: " CPF
echo -e $'\n'"$CPF"

read -t1 -p "Digite uma frase o Mais rapido que puder!!: " F
echo -e "$F"
