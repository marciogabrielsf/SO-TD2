pasta_origem=$1 #pasta de origem vinda do projeto2.sh
pasta_destino=$2 #pasta de destino vinda do projeto2.sh

backup_folder()
{
    #Verifica se a pasta de destino existe, se não existir, cria uma.
    if [ ! -d $pasta_destino ]; then
        echo "Pasta $pasta_destino não existe, criando uma..."
        mkdir $pasta_destino
        # exit 1
    fi

    #Verifica se a pasta de origem existe, se não existir, cria uma.
    if [ ! -d $pasta_origem ]; then
        mkdir $pasta_origem
    fi

    #Verifica se a pasta de destino está vazia, se não estiver, apaga tudo.
    if  ls -A1q $pasta_destino | grep -q . ; then
        rm -r $pasta_destino/*
    fi

    #Verifica se a pasta de origem está vazia, se não estiver, copia tudo.
    if  ls -A1q $pasta_origem | grep -q . ; then
        cp -r $pasta_origem/* $pasta_destino #copia tudo da pasta de origem para a pasta de destino
    fi

}

generate_log() 
{ #função que gera o log

    #Faz um grep no ausearch com a chave da pasta e filtra apenas os eventos do tipo SYSCALL
    filtered_log="$(ausearch -i -k pasta | grep "SYSCALL")"

    #Limpa o arquivo de log antes de escrever nele
    echo > log.txt
    
    #Lê o que ele recebe do ausearch
    echo "$filtered_log" | while IFS= read -r line; do #para cada linha do log, pegue o tipo, data e pid


        type=$(echo "$line" | grep -oP '(?<=type=)[^[:space:]]+') #dá um grep na linha e filtra apenas o tipo.
        date=$(echo "$line" | grep -oP '\d{2}/\d{2}/\d{4} \d{2}:\d{2}:\d{2}') #dá um grep na linha e filtra apenas a data.
        ppid=$(echo "$line" | grep -oP '(?<=ppid=)[^[:space:]]+') #dá um grep na linha e filtra apenas o ppid.
        pid=$(echo "$line" | grep -oP '(?<=\s)pid=[0-9]+' | cut -d= -f2) #dá um grep na linha e filtra apenas o pid.
    
    echo "Evento detectado: Date: $date | Tipo: $type | PPID: $ppid | PID: $pid" >> log.txt #escreve no arquivo log o evento.
    # echo "Evento: $filtered_log" | grep "SYSCALL" >> log.txt
    done
}


generate_log #chama a função de log
backup_folder #chama a função de backup