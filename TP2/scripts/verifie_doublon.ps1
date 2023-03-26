# On récupère le nom de l'utilisateur ou du groupe
$nom = $args[0]
$option = $args[1]
# On vérifie si l'option est -g ou -u
    if ($option -eq "-g") {
        Get-LocalGroup -Name $nom
        if ($?) {
            Write-Host "Le groupe $nom existe"
        }
        else {
            Write-Host "Le groupe $nom n'existe pas"
        }
    }
    elseif ($option -eq "-u") {
        Get-LocalUser -Name $nom
        if ($?) {
            Write-Host "L'utilisateur $nom existe"
        }
        else {
            Write-Host "L'utilisateur $nom n'existe pas"
        }
    }
    else {
        Write-Host "Erreur : Option non reconnue"
    }
