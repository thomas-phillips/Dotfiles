#!/bin/bash

if [ -z "$1" ];then
    echo "Usage: $0 <folder>"
    exit 1
fi

FOLDER=$1

CONFIG_PATH="$HOME/.config"

if [ ! -d "$FOLDER" ]; then
    echo "Error: $FOLDER is not a valid directory."
    exit 1
fi

for DIR in "$FOLDER"/*; do
    if [ -d "$DIR" ]; then
        FULL_PATH=$(realpath $DIR)
        BASE_DIR=$(basename $FULL_PATH)
        CONFIG_CONCAT="${CONFIG_PATH}/${BASE_DIR}"

        if [ -d $CONFIG_CONCAT ]; then
            echo "Removing folder: $CONFIG_CONCAT"
            rm -rf $CONFIG_CONCAT
        fi

        echo "Creating link between $FULL_PATH and $CONFIG_CONCAT"
        ln -sf $FULL_PATH $CONFIG_CONCAT
    fi
done

echo "Symlinks created sucessfully"
