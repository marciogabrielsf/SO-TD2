# Introdução

Este programa funciona com duas bibliotecas do linux, o audit e o iWatch.

Para instalar-las, utilize os seguintes comandos no terminal:

```
sudo apt-get install auditd audispd-plugins
apt-get install iwatch
```

# QUANDO FOR INICIAR FAÇA ISSO:

Apague todos os logs antigos do audit com ```sudo rm /var/log/audit/*```
Em seguida reinicie o serviço do audit com: ```sudo service auditd rotate```

Agora sim, só executar:

Executa-se com:
```sudo /bin/bash <diretorio_arquivo.sh> <pasta_a_ser_copiada> <pasta_destino>```

Exemplo:
```sudo /bin/bash ./projeto2.sh ./pasta ./backupfolder```

ao executar, basta ir na pasta que você quer escutar e pronto. Ao fazer qualquer alteração ele fará o backup no diretório que você selecionar
e em seguida escreverá no arquivo .log a data, o tipo, o PID e o PPID (parent process ID) de quem fez a modificação.

> O arquivo de log será gerado no mesmo diretório do projeto.sh
