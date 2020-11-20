#!/bin/bash
# print("Average_Running_Children_of_ParentID= " + prev + " is " + (sum / count))

./4.sh | awk 'BEGIN{ prev = -1 } { 
        if (prev != $4) { 
            if (prev != -1) {
                print("Average_Running_Children_of_ParentID =", prev, "is", (sum / count))
            }
            sum = 0
            count = 0
        } 
        count++
        sum = sum + $6
        prev = $4
        print
    }
    END{ print("Average_Running_Children_of_ParentID =", prev, "is", (sum / count)) }'
