#!/bin/bash
cd /proc
pids=()
mems=()
for i in $(ls | grep -E "[0-9]+")
do
    success=$(ls | grep "$i")
    if [ -n "$success" ] 
    then
        cd "$i"
        info=$(cat io 2> /dev/null | grep "read_bytes" | awk '{print $2}')
        if [ -n "$info" ]
        then
            pids+=("$i")
            mems+=("$info")
        fi
        cd ..
    fi
done

sleep 1m
table=""
for ((i = 0; i < "${#pids[@]}"; i++)) 
do
    pid=${pids[i]}
    mem=${mems[i]}
    success=$(ls | grep "$pid")
    if [ -n "$success" ] 
    then
        cd "$pid"
        info=$(cat io 2> /dev/null | grep "read_bytes" | awk '{print $2}')
        if [ -n "$info" ]
        then
            let delta=info-mem
            table+="$pid : "
            table+="$delta"
            table+=$'\n'
        fi
        cd ..
    fi
done
data=$(echo "$table" | head -n -1 | sort -k 3 -n |  tail -n 3)
sortedpids=($(echo "$data" | awk '{print($1)}'))
sortedmems=($(echo "$data" | awk '{print($3)}'))

for ((i = 0; i < "${#sortedpids[@]}"; i++))
do
    pid=${sortedpids[i]}
    success=$(ls | grep "$pid")
    if [ -n "$success" ] 
    then
        cd "$pid"
        info=$(cat cmdline | tr -d '\0')
        if [ -n "$info" ]
        then
            echo $pid:$info:${sortedmems[i]}
        fi
        cd ..
    fi
done
