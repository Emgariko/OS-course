#!/bin/bash
cd /proc
mx=-1
res="-1"
for i in $(ls | grep -E "[0-9]+")
do
    success=$(ls | grep "$i")
    if [ -n "$success" ] 
    then
        cd "$i"
#         curmem=$(cat statm | awk '{print($6)}')
        curmem=$(cat statm | awk '{print($2)}')
        if [ "$mx" -lt "$curmem" ] 
        then
            mx="$curmem"
            res="$i"
        fi
        cd ..
    fi
done

echo "Max data process PID = " "$res" ", value = " "$mx"
