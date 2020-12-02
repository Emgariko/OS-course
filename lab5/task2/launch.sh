#!/bin/bash
k=$1
n=$2
# k=10

# 291000000 / 10
# n=29100000    
for ((i = 1; i <= "$k"; i++)); do
    sleep 1
    ({ 
        ./newmem.bash "$n"
    }) &
#     echo Started "$i" scripts.
done
