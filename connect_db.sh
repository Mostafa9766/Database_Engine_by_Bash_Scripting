#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
#regex='[+*.-_{}$><|:;@-\^(/)=^#!~&`"]'
#regex='[+*-/]';
echo -e "${yellow}--------- Database Connect--------${none}"
echo -e "${yellow}Enter Database you want to connect to ${none}"
read dbname

while [[ -z $dbname ]] || [[ $dbname =~  *['!''@#/$\"*{^})(+|,;:~`._%&/=-]>[<?' ]] || [[ $dbname =~ [0-9] ]]
do
        echo -e "${red}Invalid Database Name... ${none}"
        read -p "PLease Enter a valid Database Name Again: " dbname
done

if [ -d ./Databases/$dbname ]
then
	cd Databases/$dbname
    echo "you just connected to the database $dbname"
    select choice in "create table" "List table" "Drop table" "Insert into table" "Select from table" "Show table" "Delete from table" "Update table" "Back to main menu" "Exit"
do 
    case $choice in 
        "create table")
		 
	;;
	"List table") 
		ls 
        ;;
	 "Drop table")
     		
        ;;

 	"Insert into table")
			
        ;;

        "Select from table")

        ;;

        "Show table")
               
        ;;    

        "Delete from table")
		
        ;;        

        "Update table")
		
        ;;       
        "Back to main")
            cd ../../
            . ./db_menu.sh   
            ;;
        "Exit")
            exit
            ;;
	*)
		echo -e "${red}Invalid Option...  -_- ${none}"
	;;
    esac 
done  
else
	echo -e "${red}There is no such a database in your Databases -_- ${none}"    

fi
