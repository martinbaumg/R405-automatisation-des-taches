# Demande le nom d'utilisateur
$username = Read-Host "nom"

# Vérifier que le nom d'utilisateur n'est pas vide
if ([string]::IsNullOrEmpty($username)) {
    Write-Error "Le nom est vide."
    Exit 1
}

# Demande le mot de passe
$password = Read-Host "mdp" -AsSecureString

# Vérifier que le mot de passe n'est pas vide
if ($password.Length -eq 0) {
    Write-Error "mdp est vide."
    Exit 1
}

New-LocalUser -Name $username -Password $securePassword -AccountNeverExpires -Disabled

# Ajouter l'utilisateur au groupe Utilisateurs
Add-LocalGroupMember -Group "Utilisateurs" -Member $username

Write-Output "L'utilisateur $username a été créé avec succès et ajouté au groupe Utilisateurs."
