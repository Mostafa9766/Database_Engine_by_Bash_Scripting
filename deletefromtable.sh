#!/usr/bin/bash
ls
echo "Enter the table you wish to delete from"
read table
if [ ! -f ./$table ]
then
    echo "the table you entered does not exist"    
else 
    cat $table
    echo "Enter row PK to delete"
    read rowPK
    num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' ./$table)
    if [ "$num" == "" ]
    then 
        echo "can't find the record you're looking for"
    else     
        sed -i ''/$num/'d' ./$table
        echo "entry with PK $rowPK was deleted"
    fi
fi    