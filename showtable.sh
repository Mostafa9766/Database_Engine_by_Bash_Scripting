#!/usr/bin/bash

source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
ls
echo -e "${yellow}enter table name you want to view${none}"
read table
if [ ! -f ./$table ]
then
    echo -e "${red}the table you entered does not exist${none}"    
else
    cat ./$table 
fi 
