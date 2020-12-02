#!/bin/bash
step_counter=0
list=()
while :;do
    list+=(1 2 3 4 5 6 7 8 9 10)
    step_counter=$(("$step_counter"+1))
    if [[ $(($step_counter % 100000 )) == 0 ]]; then
        if [[ $step_counter == 100000 ]]; then
            echo "Array size: " "${#list[*]}" > report2.log
        else
            echo "Array size: " "${#list[*]}" >> report2.log
        fi
        echo "Step: " "$step_counter" >> report2.log
    fi
done

