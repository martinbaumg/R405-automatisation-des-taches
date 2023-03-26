# On récupère les événements du log System et de la source user32
	$events = Get-EventLog -LogName System -Source user32
	# On crée un tableau
	$tab = @()
	# On parcourt les événements
	foreach ($event in $events) {
		# On récupère la raison de l'extinction
		$reason = $event.Message
		# On récupère la date de l'extinction
		$date = $event.TimeGenerated
		# On ajoute les informations dans le tableau
		$tab += New-Object PSObject -Property @{
			"Raison" = $reason
			"Date" = $date
		}
	}
	# On exporte le tableau dans un fichier CSV
	$tab | Export-CSV -Path "C:\Users\Administrateur\Downloads\Exercice9.csv" 
	-NoTypeInformation