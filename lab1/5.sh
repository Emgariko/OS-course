#!/bin/bash
dir="/var/log/syslog"
awk '{if ($6 == "<info>") print}' $dir > info.log
