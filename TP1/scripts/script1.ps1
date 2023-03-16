$disk = Get-WmiObject -Class Win32_LogicalDisk -Filter "DeviceID='C:'"
$used = $disk.Size - $disk.FreeSpace
Write-Host "Nombre d'octets utilises sur le disque C : $used"