#!/bin/bash

CWD=$(pwd)
SOURCE_DIR="$CWD/dotfiles"

TARGET_DIR="$HOME/.config"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory not found: $SOURCE_DIR"
    exit 1
fi

for item in "$SOURCE_DIR"/*; do
    name=$(basename "$item")

    rm -rf "$TARGET_DIR/$name"
    ln -sf "$item" "$TARGET_DIR/$name"

    echo "Symlink created: $TARGET_DIR/$name -> $item"
done
