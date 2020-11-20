#!/bin/bash
dir="/etc/passwd"
awk -F":" '{print $1 " " $3}' $dir | sort -k 2 -n
