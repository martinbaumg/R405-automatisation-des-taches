$disk = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
$used = $disk.Size - $disk.FreeSpace
$usedPercent = [math]::Round(($used / $disk.Size) * 100, 2)
Write-Host "Pourcentage occupé du disque C : $usedPercent%"