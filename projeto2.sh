#!/bin/bash
/bin/bash ./backup_script.sh $1 $2


echo "Listening..."
iwatch -r -c "/bin/bash ./backup_script.sh $1 $2" $1 
