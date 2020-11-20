#!/bin/bash
dir="/var/log/*.log"

cat $dir | wc -l
