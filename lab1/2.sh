#!/bin/bash
str=""
result=""
while [[ "$str" != "q" ]]
do
    read str
    result+="$str"
done
echo "$result"
