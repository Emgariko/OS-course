#!/bin/bash
mode="add"
res=1
(tail -f pipe) | 
while true; do
    read LINE
    case $LINE in 
        QUIT)
            echo "exit"
            killall tail
            exit
            ;;
        \*)
            mode="mul"
            ;;
        +)
            mode="add"
            ;;
        *)
            if [[ $LINE =~ [0-9]+  ]] 
            then
                if [[ $mode=="add" ]]
                then
                    res=$((res + $LINE))
                else 
                    res=$((res * $LINE))
                fi
            else
                echo $LINE
            fi
            ;;
    esac
    echo $res
done
