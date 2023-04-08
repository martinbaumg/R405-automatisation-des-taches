#!/bin/bash

if [ $# -lt 3 ]; then
    echo "Veuillez spécifier le nom d'un dossier, le caractère à remplacer, et le caractère de remplacement en paramètres."
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
        newfile=$(echo "$file" | tr "$2" "$3")
        if [ "$newfile" != "$file" ]; then
            mv -v "$file" "$newfile"
        fi
    fi
done
