#!/bin/bash

if [[ -e $1 && -e $1 ]]
then 
  backup_src=$1
else
  echo "Source for backup is not specified"
  exit 1
fi

if [ $2 ]
then
  backup_name=$2
else
  backup_name=$(basename $1)
fi

backup_dir="$HOME/sbackup/$(date +%Y%m%d-%H%M%S)"

mkdir -p $backup_dir
echo "Creating backup direcory at: $backup_dir"

tar cJf "$backup_dir/$backup_name.tar.xz" "$backup_src"

