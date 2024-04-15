#!/bin/bash

echo "Enter a directory path:"
read dir

if [[ ! -d $dir ]]; then
    echo "Directory does not exist."
    exit 1
fi

options=("List files" "Copy a file" "Exit")
select opt in "${options[@]}"; do
    case $opt in
        "List files")
            ls "$dir"
            break
            ;;
        "Copy a file")
            echo "Enter the file path to copy:"
            read file
            if [[ ! -f $file ]]; then
                echo "File does not exist."
                exit 1
            fi
            echo "Enter the destination path:"
            read dest
            cp "$file" "$dest"
            break
            ;;
        "Exit")
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
