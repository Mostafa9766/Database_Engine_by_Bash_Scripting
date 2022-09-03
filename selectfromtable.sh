#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
ls
echo -e "${yellow}Enter the table you want to select from${none}"
read table
if [ ! -f ./$table ]
then
    echo -e "${red}table not exist ${none}"    
else 
    cat $table
    echo -e "${yellow}Enter row PK to select${none}"
    read rowPK
    num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' ./$table)
    if [ "$num" == "" ]
    then 
        echo -e "${red}can't find the record you entered ${none}"
    else     
        echo $num
    fi
fi    
