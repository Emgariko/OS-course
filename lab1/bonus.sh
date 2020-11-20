#!/bin/bash
for i in $*
do
let value=RANDOM*$i
echo "Processing the argument" "$i" "gave the result" $value
done
