#!/bin/bash

# Vérification de la présence d'un argument
if [ $# -eq 0 ]
then
    # Affichage d'un message d'erreur si aucun argument n'est passé
    echo "Aucun argument passé. Le programme s'arrête."
    exit 1
fi

# Récupération de l'argument passé (le nombre)
nombre=$1

# Initialisation du résultat à 1
resultat=1

# Boucle pour calculer la puissance
for (( i=1; i<=$nombre; i++ ))
do
    resultat=$((resultat * nombre))
done

# Affichage du résultat
echo "$nombre à la puissance $nombre est égal à $resultat"
