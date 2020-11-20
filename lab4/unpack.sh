#!/bin/bash
restore_dir=~/restore
now=$(date +"%Y-%m-%d")
backups_dir=~/""
backup_name=""
dest_dir=~/"restore"
mn="1000000000000000000000000"
for curfile in $(ls -d ~/* | grep -E '^/home/emil/Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}$'); do
    cur_name=$(echo "$curfile" | awk -F "/" '{print $NF}' )
    cur_date=$(echo "$cur_name" | cut -c 8-)
    now_sec=$(date -d "$now" +"%s")
    cur_dir_sec=$(date -d "$cur_date" +"%s")
    let difference=($now_sec - $cur_dir_sec)
    if [[ "$difference" -lt "$mn" ]]; then
        backup_name="$curfile"
        mn=$difference
    fi
done

if [[ "$backup_name" == "" ]]; then
    echo "unpack: backup does not exist"
fi
for curfile in $(ls "$backup_name"); do
    if [[ -f "$restore_dir/$curfile" || -d "$restore_dir/$curfile" ]]; then
        echo "unpack: file or directory is already unpacked:" "$curfile"
        continue
    fi
    if [[ ! "$curfile" =~ ^.*\.[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then
        cp -R "$backup_name"/"$curfile" "$restore_dir"/"$curfile"
    fi
done
