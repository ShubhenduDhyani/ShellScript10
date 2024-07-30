#!/bin/bash

<< DESCRIPTION
This script takes backup of given directory 
./backup.sh <path of source directory> <path of target directory>
DESCRIPTION

source_dir=$1
target_dir=$2
backup_timestamp=$(date '+%y-%m-%d-%H-%M-%S')
backup_dir="${target_dir}/backup_${backup_timestamp}"

function create_backup {

gzip -rc "${source_dir}" > "${backup_dir}.gz"

if [ $?="'0'" ]; then
	echo "backup taken successfully"
else
	echo "error while taking backup for $backup_timestamp"
fi
}


function rotate_backup {
backups=($(ls -t "$target_dir/backup_"*.gz))

if [ "${#backups[@]}" > "'5'" ]; then
	backups_to_delete=("${backups[@]:5}")
	for backup in "${backups_to_delete[@]}";
	do
		rm "$backup"
	done
fi
}

create_backup
rotate_backup

