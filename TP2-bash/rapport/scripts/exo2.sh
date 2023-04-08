#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Veuillez spécifier le nom d'un dossier en paramètre."
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Le dossier spécifié n'existe pas."
    exit 1
fi

cd "$1"
for file in *
do
    if [ -f "$file" ] || [ -d "$file" ]; then
        newfile=$(echo "$file" | tr ' ' '-')
        if [ "$newfile" != "$file" ]; then
            mv -v "$file" "$newfile"
        fi
    fi
done
