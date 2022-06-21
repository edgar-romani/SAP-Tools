#!/bin/bash
# Função: Verificar se uma request existe no File System
# Para a execução do script é necessário definir uma request como parâmetro 
# Execução simples deve ser ./checkRequest.sh <REQUEST>
# Execução em modo verbose deve ser ./checkRequest.sh <REQUEST> -v

modo_verbose() {
    if [ $existe_cofile -eq 0 ] && [ $existe_data -eq 0 ]; then
        echo "Request $request encontrada!"
        echo " Cofile: ${cofile:23}"
        echo " Data: ${data:20}"
    elif [ $existe_cofile -eq 2 ] && [ $existe_data -eq 2 ]; then
        echo "Request não $request localizada!"
        echo " Data e Cofile não existem no File System!"
    else
        echo "Verifique o Data e Cofile da request: $request"
    fi
}

modo_normal() {
    if [ $existe_cofile -eq 0 ] && [ $existe_data -eq 0 ]; then
        echo "$request: Ok"
    elif [ $existe_cofile -eq 2 ] && [ $existe_data -eq 2 ]; then
        echo "$request: Não encontrada"
    else 
        echo "$request: Verificar Data e Cofile"
    fi
}


request=$1
parametro=$2

cofile=`ls /usr/sap/trans/cofiles/*${request:4:6}.${request:0:3} 2> /dev/null`
existe_cofile=`echo $?`
data=`ls /usr/sap/trans/data/*${request:4:6}.${request:0:3} 2> /dev/null`
existe_data=`echo $?`

case $2 in
    -v) modo_verbose ;;
    *)  modo_normal ;;
esac