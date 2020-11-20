#!/bin/bash
ps aux | tail -n +2 | awk '$1 == "emil" {print $0}' | wc -l
ps aux | tail -n +2 | awk '$1 == "emil" {print $1 ": " $11}'
