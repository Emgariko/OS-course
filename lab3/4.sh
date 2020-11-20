#!/bin/bash
# cpulimit -b -l 10 ./cycle.sh 
# cpulimit -b ./cycle.sh
# cpulimit -b ./cycle.sh
(./cycle.sh)&
pid1=$!
# cpulimit -b -l 10 -p $pid1 -q
cpulimit -b -l 10 -p $pid1
(./cycle.sh)&
pid2=$!
(./cycle.sh)&
pid3=$! 
echo 10%CPU limit process PID:$pid1
kill $pid3
echo Killed process PID:$pid1
