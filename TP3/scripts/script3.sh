#!/bin/bash
filename=$1
# On vérifie que le nom de fichier est bien fourni

if [ -z "$filename" ]; then
    echo "Erreur : Aucun nom de fichier spécifié"
    exit 1
fi

# On vérifie que le fichier existe

if [ ! -f "$filename" ]; then
    echo "Erreur : Le fichier $filename n'existe pas"
    exit 1
fi

# On boucle sur chaque ligne du fichier
while read -r line; do
    # On supprime les espaces en début et fin de ligne
    line="$(echo "$line" | xargs)"

    if [ -n "$line" ]; then
        if ping -c 1 "$line" > /dev/null; then
            echo "La machine $line est accessible"
            echo "$line $(date +%d/%m/%Y\ %H:%M) $(ping -c 1 "$line" | grep time= | cut -d '=' -f 2)" >> log.txt
        else
            echo "Erreur : la machine $line est inaccessible"
            echo "$line $(date +%d/%m/%Y\ %H:%M) KO" >> log.txt
        fi
    fi
    sleep 5
done < "$filename"
