# Premier test de connexion
if (Test-Connection -ComputerName $ip -Count 1 -Quiet) {
    # Récupération des informations de la machine distante
    $machine = Get-WmiObject -Class Win32_Desktop -ComputerName $ip
    $os = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ip

    # On vient créer le tableau pour y rentrer les résultats
    $result = @{
        'Nom de la machine' = $machine.Name
        'Nom de l'OS' = $os.Caption
        'Version de l'OS' = $os.Version
        'Clé d'activation de l'OS' = $os.SerialNumber
    }
    $choice = Read-Host "Voulez-vous afficher les résultats (a) ou les exporter dans un fichier CSV (b) ? (a/b)"

    if ($choice -eq 'a') {
        $result
    }
    elseif ($choice -eq 'b') {
        $path = Read-Host "Entrez le chemin complet et le nom du fichier CSV"
        $result | Export-Csv -Path $path -NoTypeInformation
    }
    else {
        Write-Host "Choix invalide. Les résultats ne seront pas affichés ni exportés."
    }
}
else {
    Write-Host "La machine distante n'est pas accessible."
} »