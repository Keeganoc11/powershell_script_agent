```powershell
$filePath = Read-Host "Enter the file path"
if (Test-Path $filePath) {
    $fileInfo = Get-Item $filePath
    $fileOwner = (Get-Acl $filePath).Owner
    $fileInfo | Select-Object Name, Length, LastWriteTime, @{Name="Owner";Expression={$fileOwner}} | Export-Csv -Path "log.csv" -NoTypeInformation -Append
} else {
    $errorDetails = "File not found: $filePath"
    $errorDetails | Add-Content -Path "error_log.csv"
}
```