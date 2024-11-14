#!/bin/bash

#dialog --msgbox 'Olá, sou dialog' 5 40 -- define uma 
#caixa de mensagem eo tamanho da janela com o texto
#
#gdialog --interface com gtk
#
# espera a entrada do usuario e armazena na variavel 
# (neste caso NOME_USUARIO)
read -p "Seu nome" NOME_USUARIO

# se a variavel estiver vazia executa o codigo entre as chaves
 [ -z "$NOME_USUARIO" ] && {
 MENSAGEM_ERRO="ERRO: entrada invalida"
 dialog --msgbox "$MENSAGEM_ERRO" 5 40
 exit 1
 }
#=================================--------============================
#Cria a Barra de progresso
dialog --title "Exemplo" --gauge "Barra de progresso" 8 40
#imprime o ultimo comando dialog executado
!dialog:p 
#passa a porcentagem para a barra de progresso com
#base no ultimo comando dialog executado
echo 50 | !dialog:p


#Criando menu com o dialog
acao=$(dialog --stdout \
       --menu "test" \
       0 0 0\
       se_quiser_sim "se quise sim" \
       se_quiser_nao "se quise nao")

case "$acao" in se_quiser_sim)
        temp=$(mktemp -t lixo)
        pega_campo 1 | sed 1d > "$temp"
        dialog --title "Usuarios" --textbox "$temp" 13 30
        rm $temp;;      
