```powershell
$programs = Get-WmiObject -Class Win32_Product | Select-Object Name, Version, Vendor, InstallDate
$programs | Export-Csv -Path "$PSScriptRoot\InstalledPrograms.csv" -NoTypeInformation
```