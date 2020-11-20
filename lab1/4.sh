#!/bin/bash
echo "$PWD"
echo "$HOME"
if [[ "$PWD" == "$HOME" ]] 
then
    echo "$HOME"
    exit 0
else
    echo "Error: This directory isn't home directory"
    exit 1
fi
