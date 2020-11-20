#!/bin/bash
echo "1) nano"
echo "2) vim"
echo "3) links"
echo "4) exit"
read a
if [[ $a == "4" ]]
then
    exit
elif [[ $a == "1" ]]
then
    nano
elif [[ $a == "2" ]] 
then
    vim
elif [[ $a == "3" ]] 
then
    links
fi
