#!/bin/bash
dir="/var/log/Xorg.0.log"

#awk '{if (^(WW) || ^(II) ) print}' $dir | sed 's/(WW)/---Warning---/' | sed 's/(II)/---Information---/' | sort -k 2 > full.log

awk '/(WW)/ {print}' $dir | sed 's/(WW)/---Warning---/' > full.log  
awk '/(II)/ {print}' $dir | sed 's/(II)/---Information---/'  >> full.log 
