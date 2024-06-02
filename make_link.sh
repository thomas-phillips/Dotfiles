#!/bin/bash

global_dir="global"

if [ -z "$1" ];then
    echo "Usage: $0 <folder>"
    exit 1
fi

if [[ "$1" == "$global_dir" || "$1" == "global/" ]]; then
    echo "Invalid choice: $global_dir"
    exit 1
fi

folder=$1

config_path="$HOME/.config"

if [ ! -d "$folder" ]; then
    echo "Error: $folder is not a valid directory."
    exit 1
fi

remove_first_folder() {
    new_path=$(echo "$1" | sed 's/^[^\/]*\///')
    echo "$new_path"
}

create_directory() {
    full_path=$(realpath $1)
    new_path=$(remove_first_folder $1)
    config_concat="${config_path}/${new_path}"

    echo "$config_concat"
    if [ -d $config_concat ]; then
        echo "Directory exists: $config_concat"
    else
        echo "Creating directory: $config_concat"
        mkdir -p $config_concat
    fi
}

create_file_symlink() {
    full_path=$(realpath $1)
    new_path=$(remove_first_folder $1)
    config_concat="${config_path}/${new_path}"

    echo "Creating link between $full_path and $config_concat"
    ln -sf $full_path $config_concat
}

find "$folder" | while IFS= read item; do
    if [[ "$item" == "$folder" ]]; then
        continue
    elif [[ -d "$item" ]]; then
        create_directory $item
    elif [[ -e "$item" ]]; then
        create_file_symlink $item
    fi
done


echo ""
echo "Symlinks created sucessfully"

