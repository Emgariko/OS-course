#!/bin/bash
# cat $PPID $$
# ps -efj | awk -v pid=$$ '$3 != "PID" && $2 != pid && $3 != pid {print}' | tail -n 1
# ps -o pid, ppid, command | awk -v pid=$$ '$3 != "PID" && $2 != pid && $3 != pid {print}' | tail -n 1
ps -ax -o pid,ppid,command | awk -v pid=$$ '$1 != "PID" && $1 != pid && $2 != pid {print}' | tail -n 1
# ps aux P T | awk -v pid=$$ '$2 != "PID" && $2 != pid && $2 != pid {print}' | tail -n 10
# ps aux T | awk -v ppid=$PPID -v pid=$$ '$2 != "PID" && $2 == "PID" && $2 != ppid && $2 != pid {print} END{ print(pid, ppid) }
# ps aux T | tail -n 5 | head -n 1

# :fix:
