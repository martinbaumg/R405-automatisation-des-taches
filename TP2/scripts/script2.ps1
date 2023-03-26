# Importer le module Microsoft.PowerShell.LocalAccounts
Import-Module Microsoft.PowerShell.LocalAccounts

# Récupérer la liste des utilisateurs locaux
$localUsers = Get-LocalUser

# Parcourir la liste des utilisateurs et afficher leur nom et la date de leur dernière connexion
foreach ($user in $localUsers) {
    $lastLogon = $user.LastLogon
    if ($lastLogon -ne $null) {
        $lastLogonDate = [DateTime]::FromFileTime($lastLogon)
        Write-Output "$($user.Name) - Dernière connexion : $($lastLogonDate.ToString())"
    } else {
        Write-Output "$($user.Name) - L'utilisateur n'a jamais été connecté."
    }
}
