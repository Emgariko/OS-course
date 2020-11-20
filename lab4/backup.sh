#!/bin/bash
now=$(date +"%Y-%m-%d")
backup_name=""
for curdir in $(ls -d ~/* | grep -E '^/home/emil/Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$'); do
    cur_name=$(echo "$curdir" | awk -F "/" '{print $NF}' )
    cur_date=$(echo "$cur_name" | cut -c 8-)
    now_sec=$(date -d "$now" +"%s")
    cur_dir_sec=$(date -d "$cur_date" +"%s")
    let difference=($now_sec - $cur_dir_sec)
    if [[ "$difference" -lt 7*24*60*60 ]]; then
        backup_name="$cur_name"
    fi
done
backup_report_dir=~/backup-report
source_dir=~/source
if [[ "$backup_name" == "" ]]; then
    backup_name="Backup-"$now
    backup_dir=~/$backup_name
    mkdir $backup_dir
    echo "------> INFO <------"
    echo "New backup directory created: "$backup_dir", "$now"" >> "$backup_report_dir"
    echo ">Copied files:" >> "$backup_report_dir"
    for curfile in $(ls "$source_dir"); do
        if [[ -d "$source_dir"/"$curfile" ]]; then
            cp -R "$source_dir"/"$curfile"* "$backup_dir"/"$curfile"
            echo "-> Copied" content from "$curfile" >> "$backup_report_dir"
        elif [[ -f "$source_dir"/"$curfile" ]]; then
            cp "$source_dir"/"$curfile" "$backup_dir"/"$curfile"
            echo "-> Copied" "$curfile" >> "$backup_report_dir"
        fi
    done
    echo 
else 
    echo "------> INFO <------" >> "$backup_report_dir"
    echo "New changes at fresh backup" >> "$backup_report_dir"
    backup_dir=~/$backup_name
    for curfile in $(ls "$source_dir"); do
        if [[ -d "$backup_dir"/"$curfile" || -f "$backup_dir"/"$curfile" ]]; then
            sourcetype=$([[ -d "$source_dir"/"$curfile" ]] | echo "dir")
            desttype=$([[ -d "$backup_dir"/"$curfile" ]] | echo "dir")
            if [[ "$sourcetype" == "$desttype" ]]; then 
                source_size=$(du "$source_dir"/"$curfile" | tail -n 1 | cut -f 1)
                dest_size=$(du "$backup_dir"/"$curfile" | tail -n 1 | cut -f 1)
                if [[ "$source_size" != "$dest_size" ]]; then
                    if [[ -d "$backup_dir/$curfile.$now" || -f "$backup_dir/$curfile.$now" ]]; then
                        echo "-> This file("$backup_dir/$curfile") is already restored" >> "$backup_report_dir"
                        continue;
                    fi
                    mv "$backup_dir/$curfile" "$backup_dir/$curfile.$now"
                    if [[ "$sourcetype" == "dir" ]]; then 
                        cp -R "$source_dir/$curfile"* "$backup_dir/$curfile"
                        echo "-> Copied" content from "$curfile" >> "$backup_report_dir"
                    else
                        cp "$source_dir"/"$curfile" "$backup_dir"/"$curfile"
                        echo "-> Copied" "$curfile" >> "$backup_report_dir"
                    fi
                    echo "-- Renamed: $backup_dir/$curfile" "-->" "$backup_dir/$curfile.$now" >> "$backup_report_dir"
                fi
            else
                echo "-> Copying failed: file from src(or dst) and directory from dst(src) with the same names found: "$curfile"" >> "$backup_report_dir"
            fi
        else
            if [[ -d "$source_dir"/"$curfile" ]]; then
                cp -R "$source_dir"/"$curfile"* "$backup_dir"/"$curfile"
                echo "-> Copied" content from "$curfile" >> "$backup_report_dir"
            elif [[ -f "$source_dir"/"$curfile" ]]; then
                cp "$source_dir"/"$curfile" "$backup_dir"/"$curfile"
                echo "-> Copied" "$curfile" >> "$backup_report_dir"
            fi
        fi
    done
    
fi
