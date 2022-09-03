#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
re='^[0-9]+$'
ls
echo -e "${yellow} enter table : ${none}"
read listtables
if [ -f $listtables ]
then
	num=$(awk 'BEGIN {FS=":"} ; END{print NF-1}' $listtables)
	for n in $(seq $num)
	do
		echo -e "${yellow}Insert your data : ${none}"
		read ans
		columnType=$(awk -v i="$n" -F: '{if(NR == i) print $2}' .$listtables)
		if  [[ $columnType == "int" ]];
		then
			if ! [[ $ans =~ $re  ]];
			then
				echo -e "${yellow}entry needs to be an integer ${none}"
				break
			else
                		entry+=$ans:
            		fi
		else
                	entry+=$ans:
			echo $entry >> $listtables
		fi
	done
	entry=""

	echo -e "${yellow}Done...${none}"
else
	echo -e "${red} this table name not exist${none}"
fi
