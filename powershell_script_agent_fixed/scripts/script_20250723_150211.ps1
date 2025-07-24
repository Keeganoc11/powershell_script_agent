```powershell
$drives = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"
$report = @()

foreach ($drive in $drives) {
    $freeSpace = [math]::Round(($drive.FreeSpace / 1GB), 2)
    $totalSpace = [math]::Round(($drive.Size / 1GB), 2)
    $percentFree = [math]::Round(($freeSpace / $totalSpace * 100), 2)

    if ($percentFree -lt 20) {
        $driveInfo = [PSCustomObject]@{
            Drive = $drive.DeviceID
            FreeSpace_GB = $freeSpace
            TotalSpace_GB = $totalSpace
            PercentFree = $percentFree
        }
        $report += $driveInfo
    }
}

$report | Export-Csv -Path "C:\Path\To\DrivesReport.csv" -NoTypeInformation
```