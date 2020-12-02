#!/bin/bash 
#!/bin/bash
n=$1
# 291000000 / 10
# n=29100000
step_counter=0
list=()
while :;do
#     list+=(1 2 3 4 5 6 7 8 9 10)
    list+=(1 2 3 4 5 6 7 8 9 10)
    step_counter=$(("$step_counter"+1))
    if [[ $(($step_counter % 100000 )) == 0 ]]; then
        if [[ $step_counter == 100000 ]]; then
            echo "Array size: " "${#list[*]}" > report.log
        else
            echo "Array size: " "${#list[*]}" >> report.log
        fi
        echo "Step: " "$step_counter" >> report.log
    fi
    if [[ "${#list[*]}" -ge "$n" ]]; then
        break;
    fi
done

