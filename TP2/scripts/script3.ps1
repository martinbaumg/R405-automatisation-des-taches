$events = Get-EventLog -LogName System -Source user32
# création du tableau
$tab = @()
	foreach ($event in $events) {
		$reason = $event.Message	
		$date = $event.TimeGenerated
		$tab += New-Object PSObject -Property @{
			"Raison" = $reason
			"Date" = $date
		}
	}
# export du tableau dans un fichier csv
$tab | Export-CSV -Path "C:\Users\Administrateur\Downloads\Exercice8.csv" -NoTypeInformation