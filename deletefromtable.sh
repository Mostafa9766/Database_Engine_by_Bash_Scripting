#!/usr/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh

ls
echo -e "${yellow} Enter the table you want to delete from${none}"
read table
if [ ! -f ./$table ]
then
    echo -e "${red}the table you entered doesn't exist${none}"    
else 
    cat $table
    echo -e "${yellow}Enter row PK to delete${none}"
    read rowPK
    num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' ./$table)
    if [ "$num" == "" ]
    then 
        echo -e "${red}can't find the record you enterd${none}"
    else     
        sed -i ''/$num/'d' ./$table
        echo -e "${yellow}entry with PK $rowPK was deleted${none}"
    fi
fi    
