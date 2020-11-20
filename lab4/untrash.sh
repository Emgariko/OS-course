#!/bin/bash
name=$1
[[ $# -ne 1 ]] && echo "untrash: script expect the only argument" && exit 1
line_count=$(wc -l ~/.trash/.trash.log | awk '{print $1}')
((line_count--))
for ((i=line_count;i>=0;i--));
do
    ppath=$(awk -v i="$i" '{if (NR-1 == i) {print $1}}' ~/.trash/.trash.log)
    id=$(awk -v i="$i" '{if (NR-1 == i) {print $2}}' ~/.trash/.trash.log)
    curname=$(echo $ppath | awk -F "/" '{print $NF}')
    target_file=~/.trash/"$id"
    if [[ ! -f ~/.trash/"$id" ]];
    then 
        continue
    fi
    if [[ "$curname" == "$name" ]];
    then
        while true;
        do
            read -r -p "Do you want to restore '$ppath'? [y/N] " response
            if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]];
            then
                break
            elif [[ "$response" =~ ^([nN][oO]|[nN])$ ]]; 
            then
                break
            fi
            echo Please, type [y/N]
        done
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]];
        then
            echo "Ok, restoring" \'$ppath\', "target_file =" \'$target_file\'
            ln "$target_file" "$ppath"
            if [[ "$?" != 0 ]]; 
            then
                echo "Cannot restore file, previous file directory does not exist. Trying to restore it to home-directory."
                ln "$target_file" "$HOME/$name"
                if [[ "$?" != 0 ]]; 
                then
                    while true; 
                    do
                        read -r -p "Can not restore file to home-directory, name conflict occured. Enter new filename:" response1
                        ln "$target_file" $HOME/$response1
                        if [[ "$?" == 0 ]];
                        then
                            echo "Success"
                            break
                        fi
                        echo "Name conflift occured again."
                    done
                else
                    echo "Success"
                fi
            fi
            rm "$target_file"
            break
        else
            echo Ok, does not restore \'"$ppath"\'
        fi
    fi
done
