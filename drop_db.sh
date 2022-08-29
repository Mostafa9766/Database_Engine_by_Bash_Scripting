#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
#regex='[+*.-_{}$><|:;@-\^(/)=^#!~&`"]'
#regex='[+*-/]';


echo -e "${yellow}---------Drop Database--------${none}"
read -p "Enter Database Name you wanna Drop it  =: " dbname
while [[ -z $dbname ]] || [[ $dbname =~  *['!''@#/$\"*{^})(+|,;:~`._%&/=-]>[<?' ]] || [[ $dbname =~ [0-9] ]]
do
        echo -e "${red}Invalid Database Name... ${none}"
        read -p "PLease Enter a valid Database Name Again: " dbname
done

if [ -d ./Databases/$dbname ];then
	rm -r ./Databases/$dbname
	echo -e "${red}Database *>> $dbname <<*  was Dropped -_*${none}"
else
	echo -e "${red}There is no such a database in your Databases -_- ${none}"    

fi
