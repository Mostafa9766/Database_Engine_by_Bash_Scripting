#!/bin/bash

source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh

re='^[0-9]+$'
ls
echo -e "${yellow}Enter table name for update${none}"
read table
if [ ! -f $table ]
then
	echo -e "${red}table doesn't exist${none}"
else
	cat $table
	echo -e "${yellow}Enter row PK to updata${none}"
	read rowPK
	num=$(awk -v row_num=$rowPK 'BEGIN{ FS = ":"}{ if( row_num == $1 ){ print } }' $table)
	if [ "$num" == "" ]
	then
	    echo -e "${red}can't find the record you're entered${none}"
	else
		sed -i ''/$num/'d' $table
		num2=$(awk 'BEGIN {FS=":"} ; END{print NF-1}' $table)
		for n in $(seq $num2)
		do
			echo -e "${yellow}Insert your data${none}"
			read ans
			columnType=$(awk -v i="$n" -F: '{if(NR == i) print $2}' .$table)
			if  [[ $columnType == "int" ]]
			then
				if ! [[ $ans =~ $re  ]]
				then
					echo -e "${red}entry needs to be an integer${yellow}"
					break
				else
               	 			entry+=$ans:
            			fi
			else
            	        entry+=$ans:
			echo $entry >> $table
			fi
		done
		echo -e "${yellow} Done...${none}"
		entry=""
	fi
fi

