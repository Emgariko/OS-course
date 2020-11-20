#!/bin/bash
name=$1
[[ $# -ne 1 ]] && echo "rmtrash: script expect the only one argument" && exit 1
[[ "$name" =~ ^.*/.*$ ]] && echo "rmtrash: unacceptable filename:" \'"$name"\' && exit 1
[[ ! -f "$name" ]] && echo "rmtrash: file does not exist:" \'"$name"\' && exit 1
if [[ ! -f ~/.trash/.incrementer ]]
then
    touch ~/.trash/.incrementer
    echo 0 > ~/.trash/.incrementer
fi
incrementer_value=$(cat ~/.trash/.incrementer)

if [[ ! -d ~/.trash ]]
then
    mkdir ~/.trash
fi
ln "$name" ~/.trash/$incrementer_value 
echo >> ~/.trash/.trash.log $PWD/${name} ${incrementer_value}
rm "$name"
incrementer_value=$((incrementer_value+1))
echo $incrementer_value > ~/.trash/.incrementer

# directory as argument
