#!/usr/bin/bash
source db_colours.sh
re='^[0-9]+$'
echo -e "${yellow}enter table name : ${none}"
read name1
if [ -f $name1  ];
then
	echo -e "${red} already found .${none}"
else
	echo -e "${yellow}enter number columes : ${none}"
	read number
	if ! [[ $number =~ $re ]] ; then
   		echo -e  "${red} you entered an invalid entry please enter a number${none}" 
	else
		echo -e "${yellow}your columes : ${none}"
        	for i in $(seq $number)
		do
			echo -e "${yellow}enter the column name ${none}"				
			read answer
			echo $answer:>>filesystem
			echo -e "${yellow}enter data type ${none}"
			type=""
			type+=$answer
			select choice in "Integer" "String"
    			do
    				case $REPLY in
        			1) type+=:'int'
        			break
        			;;
        			2) type+=:'string'
        			break
        			;;
        			esac
    			done
				echo $type >> .$name1
			done
			cat filesystem | tr -d "[:space:]" | paste -sd' ' >$name1
			rm filesystem
			echo -e "${yellow}Done...${none}"
		fi
fi
