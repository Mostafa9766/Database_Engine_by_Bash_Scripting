#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
regex='[+*.-_{}$><|:;@-\^(/)=^#!~&`"$]';


echo -e "${yellow}---------Create Database--------${none}"
read -p "Enter Database Name: " dbname 
if [[ -z $dbname ]] || [[ $dbname =~ $regex ]] || [[ $dbname =~ [0-9] ]]
then 
	echo -e "${red}Invalid Database Name... ${none}"
	read -p "PLease Enter Database Name Again: " dbname
	exit
elif	
[ -d ./Databases/$dbname ] 
then
    echo -e "${red}Database already exists -_- ${none}"
elif
[ ! -d ./Databases/$dbname ]
then
	mkdir ./Databases/$dbname
	echo -e "${green}Database created successfully ^_^ ${none}"
fi