#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
#regex='[+*.-_{}$><|:;@-\^(/)=^#!~&`"]';
#regex='[+*-/]';


echo -e "${yellow}---------Create Database--------${none}"
read -p "Enter Database Name: " dbname 
while [[ -z $dbname ]] || [[ $dbname =~ $regex ]] || [[ $dbname =~ [0-9] ]]
do 
	echo -e "${red}Invalid Database Name... ${none}"
	read -p "PLease Enter Database Name Again: " dbname
done

if [ -d ./Databases/$dbname ] 
then
    echo -e "${red}Database already exists -_- ${none}"
   
fi
mkdir ./Databases/$dname  
echo -e "${yellow} Database *>> $dbname <<*  was Created -_*${none}"	





