#!/bin/bash
man bash | sed 's/[^[:alpha:]]/ /g' | awk '{ 
            for (i = 1; i <= NF; i++) {
                if (length($(i)) >= 4) { 
                    word_count[$(i)] = word_count[$(i)] + 1 
                }
            }} 
            END{
                for (val in word_count) {
                    print(word_count[val], val)
                }
            }' | sort -n -k 1 | tail -n 3
