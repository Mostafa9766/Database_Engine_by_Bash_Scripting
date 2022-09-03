#!/bin/bash
source db_colours.sh

ls
echo -e  "${yellow}Enter table name you wish to delete ${none}"
            read tablename
            if [ -f $tablename ];
            then
            	rm $tablename
		echo -e "${red}table $tablename was removed${none}"
            else
	            echo -e "${red}No such table exists in this database${none}"
            fi
