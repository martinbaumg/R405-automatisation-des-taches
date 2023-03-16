#!/bin/bash

echo "Entrez votre note : "
read note

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
else
    echo "Médiocre"
fi
