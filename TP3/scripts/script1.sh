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
    else
        # Afficher un message d'erreur si la machine est inaccessible
        echo "Erreur : la machine $ip_address est inaccessible"
    fi
    sleep 5
done
