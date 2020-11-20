#!/bin/bash
# {
d=$PWD
$DIR
cd /proc
for i in $(ls | grep -E "[0-9]+")
do
    success=$(ls | grep "$i")
    if [ -n "$success" ] 
    then
        cd "$i"
        ppid=$(cat status | grep PPid | awk '{print $2}')
        sum=$(cat sched | grep sum_exec_runtime | awk '{print $3}')
        sw=$(cat sched | grep nr_switches | awk '{print $3}')
        res=$(echo "$sum" "$sw" | awk '{print($1 / $2)}')s
        echo ProcessID: "$i" Parent_ProcessId "$ppid" Average_Running_Time: "$res"
        cd ..
    fi
done
} | sort -k 4 -n
cd ..

cd $d
# сделать чтобы скрипт возращался обратно
