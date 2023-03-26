#!/bin/bash
ip_address=$1

# on vérifie que l'addresse IP est bien fournie
if [ -z "$ip_address" ]; then
    echo "Erreur : Aucune adresse IP renseignée"
    exit 1
fi

while true; do
    if ping -c 1 $ip_address > /dev/null; then
        # Afficher un message si la machine est accessible
        echo "La machine $ip_address est accessible"
        # on enregistre la sortie de la commande dans un fichier
        echo "$ip_address $(date +%d/%m/%Y\ %H:%M) $(ping -c 1 $ip_address | grep time= | cut -d '=' -f 2)" >> log.txt
    else
        # Afficher un message d'erreur si la machine est inaccessible
        echo "Erreur : la machine $ip_address est inaccessible"
        # on enregistre la sortie de la commande 
        echo "$ip_address $(date +%d/%m/%Y\ %H:%M) KO" >> log.txt
    fi
    sleep 5
done
