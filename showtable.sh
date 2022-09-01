#!/usr/bin/bash
ls
echo "Enter table name you wish to view"
read table
if [ ! -f ./$table ]
then
    echo "the table you entered does not exist"    
else
    cat $table 
fi 