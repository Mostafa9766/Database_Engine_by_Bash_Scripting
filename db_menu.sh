#!/bin/bash
source db_colours.sh #call all ANSI code color and font format stored in db_colours.sh 

PS3="O&M_DB>>" #change prompet to "O&M_DB>>"

if [ ! -d "Databases" ] #makesure Databases exist or not 
then
    mkdir Databases
fi
echo -e "\t\t-----------------*********-----------------"
echo -e "${yellow}${italic}${blink} \t\t\tWelcom to O&M Database Engine.${none}"
echo -e "\t\t\t\t   ***** "
select choice in "Create Database" "List Database" "Connect Database" "Drop Database" "Exit Database" 
do 
	case $choice in 
		"Create Database")
			. ./create_db.sh
			;;
		"List Database")
                        . ./list_db.sh
                        ;;
		"Connect Database")
                        echo " connect"
                        ;;
		"Drop Database")
                        . ./drop_db.sh
                        ;;
		"Exit Database")
                        exit
                        ;;
		*)
			echo -e "${red}${bold}${blink} \t Not a vaild option, Please try again. ${none} "
			;;

	esac
done




