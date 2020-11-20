#!/bin/bash
dir="/etc"
#grep -E -r -o [[:alnum:]]+@[[:alnum:]]+.[[:alpha:]] $dir > emails.lst
grep -E -r -o -h -I -s "\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b" $dir | sort | uniq > email.lst
