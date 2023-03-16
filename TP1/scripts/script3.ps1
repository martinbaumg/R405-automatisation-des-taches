Get-WmiObject -Class Win32_LogicalDisk | ForEach-Object {
    $used = $_.Size - $_.FreeSpace
    $usedPercent = ($used / $_.Size) * 100
    Write-Host "Disque $($_.DeviceID) : $usedPercent % utilisé"
}