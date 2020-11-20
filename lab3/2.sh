#!/bin/bash
{
# sleep 10s; at..
./1.sh
} &
tail -f test/report
