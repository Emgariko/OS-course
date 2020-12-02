#!/bin/bash

echo "------------------------------------------INFO------------------------------------------" > toptracker.log
echo "Start." >> toptracker.log
echo "INFO: Each step every two seconds" >> toptracker.log
step=0
while :;do
    step=$(("$step"+1))
    echo "Step: " "$step" >> toptracker.log
    top -b | head -n 12 >> toptracker.log
    echo >> toptracker.log
    echo "-->mem.bash-script line: " $(top -b | head -n 100 | grep "mem.bash") >> toptracker.log
    echo >> toptracker.log
    echo "-->mem2.bash-script line: " $(top -b | head -n 100 | grep "mem2.bash") >> toptracker.log
    echo >> toptracker.log
    
    echo "------------------------------------------INFO------------------------------------------" >> toptracker.log
    sleep 2
done
