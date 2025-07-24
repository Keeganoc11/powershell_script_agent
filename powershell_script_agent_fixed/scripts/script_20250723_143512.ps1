```powershell
$drives = Get-WmiObject Win32_LogicalDisk -Filter "DriveType=3"
$reportPath = "C:\reports\drive_report.csv"

foreach ($drive in $drives) {
    $freeSpacePercentage = [Math]::Round(($drive.FreeSpace / $drive.Size) * 100, 2)
    if ($freeSpacePercentage -lt 20) {
        $drive | Select-Object DeviceID, VolumeName, @{Name="FreeSpace(GB)"; Expression={[math]::Round($_.FreeSpace / 1GB, 2)}}, @{Name="TotalSize(GB)"; Expression={[math]::Round($_.Size / 1GB, 2)}}, @{Name="FreeSpacePercentage"; Expression={$freeSpacePercentage}} | Export-Csv -Append -Path $reportPath -NoTypeInformation
    }
}
```