#!/bin/bash
# !!! IMPORTANTE: Check a variável de input que contém o path !!!
# Função: Executar o script checkRequest.sh para N requests
# O arquivo lista_requests.txt deverá ser utilizado como input neste script
# Para funcionamento correto o arquivo lista_requests.txt deve ser preenchido com o nome da request com quebra de linhas, ex:
# <REQUEST>
# <REQUEST>
# <REQUEST>
# Essas requests serão utilizados pelo script checkRequest.sh para verificação

input="/home/$USER/SCRIPTS/lista_requests.txt"

while IFS= read -r line
do
  /install_sap/sapinstall/SCRIPTS/checkRequest.sh $line | tee -a requests.log  
done < "$input"