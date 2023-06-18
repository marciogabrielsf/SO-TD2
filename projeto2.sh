#!/bin/bash
/bin/bash ./backup_script.sh $1 $2


#pega o caminho absoluto da pasta de origem passada como parametro, pois o auditctl não aceita caminhos relativos
absolute_path=$(readlink -f $1)

# cria a regra de audit para moniorar os "writes" da pasta, passando como parametro no -w o caminho absoluto da pasta, no -p o tipo de evento que ele vai escutar (no caso apenas o de write) e uma chave no -k (utilizada para localizar o evento no log)
auditctl -
auditctl -w $absolute_path -p w -k pasta

# inicia o iwatch
echo "Listening..." #printa listening
iwatch -r -c "sudo /bin/bash ./backup_script.sh $1 $2" $1 #inicia o iwatch de forma recursiva e executa o script de backup no parametro -c
