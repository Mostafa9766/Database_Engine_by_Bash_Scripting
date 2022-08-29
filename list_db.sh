#!/bin/bash
source db_colours.sh #all  ANSI code color and font format stored in db_colours.sh
echo -e "${yellow}---------List Databases--------${none}"

if [ $(ls ./Databases | wc -l) == 0  ]; then
echo -e "${red}No Databases to list -_- ${none}"  
else
   ls ./Databases
fi
