#!/bin/bash

# Définition de la fonction appréciation
function appreciation {
    note=$1
    if (( $note >= 16 && $note <= 20 ))
    then
        echo "Très bien"
    elif (( $note >= 14 && $note < 16 ))
    then
        echo "Bien"
    elif (( $note >= 12 && $note < 14 ))
    then
        echo "Assez bien"
    elif (( $note >= 10 && $note < 12 ))
    then
        echo "Moyen"
    elif (( $note >= 8 && $note < 10 ))
    then
        echo "Insuffisant"
    elif (( $note >= 0 && $note < 8 ))
    then
        echo "Médiocre"
    else
        echo "Note invalide"
    fi
}

# Vérification de la présence d'un argument
if [ $# -eq 0 ]
then
    # Affichage d'un message d'arrêt si aucun argument n'est passé
    echo "Aucune note passée en argument. Le programme s'arrête."
    exit 1
else
    # Récupération de la note passée en argument
    note=$1
fi

# Appel de la fonction appréciation avec la note en paramètre
appreciation $note
