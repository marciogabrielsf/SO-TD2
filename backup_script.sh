pasta_origem=$1
pasta_destino=$2

backup_folder()
{
    if [ ! -d $pasta_destino ]; then
        echo "Pasta $pasta_destino não existe, criando uma..."
        mkdir $pasta_destino
        # exit 1
    fi

    if [ ! -d $pasta_origem ]; then
        mkdir $pasta_origem
    fi

    if  ls -A1q $pasta_destino | grep -q . ; then
        rm -r $pasta_destino/*
    fi

    cp -r $pasta_origem/* $pasta_destino
}

backup_folder