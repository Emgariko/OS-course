#!/bin/bash

echo $$ > .pid
res=1
function usr1()
{
    res=$(( res+2 ))
}

function usr2()
{
    res=$(( res*2 ))
}

trap 'usr1' USR1
trap 'usr2' USR2

while true; do
    echo $res
    
    
    sleep 5
done
