#!/bin/bash

read -p "Entrez votre nom d'utilisateur : " username
read -s -p "Entrez votre mot de passe : " password
echo

if [[ $password == *$username* ]]; then
    echo "Le mot de passe ne doit pas contenir le nom d'utilisateur."
elif [[ ${#password} -lt 8 ]]; then
    echo "le mot de passe doit contenir au moins 8 caracères."
elif [[ ! $password =~ [0-9] ]]; then
    echo "Le mot de passe doit contenir au moins un chiffre."
elif [[ ! $password =~ [A-Z] ]]; then
    echo "Le mot de passe doit contenir au moins une majuscule."
elif [[ ! $password =~ [a-z] ]]; then
    echo "Le mot de passe doit contenir au moins une minuscule."
elif [[ ! $password =~ [^a-zA-Z0-9] ]]; then
    echo "Le mot de passe doit contenir au moins un caractère spécial."
else
    echo "Le mot de passe est valide."
fi
