#!/bin/bash

# Vérification de la présence d'au moins un argument
if [ $# -eq 0 ]
then
    # Affichage d'un message d'erreur si aucun argument n'est passé
    echo "Aucun argument passé. Le programme s'arrête."
    exit 1
fi

# Initialisation de la somme à 0
somme=0

# Boucle pour parcourir les arguments
for valeur in "$@"
do
    # Ajout de la valeur courante à la somme
    somme=$((somme + valeur))
done

# Calcul de la moyenne
moyenne=$(echo "scale=2; $somme / $#" | bc)

# Affichage de la moyenne
echo "La moyenne des valeurs passées en paramètre est de : $moyenne"
