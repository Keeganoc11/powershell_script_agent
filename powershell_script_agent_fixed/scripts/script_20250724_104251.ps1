```powershell
$filePath = Read-Host "Enter file path"
if (Test-Path $filePath) {
    $fileInfo = Get-Item $filePath
    $fileSize = $fileInfo.Length
    $lastModified = $fileInfo.LastWriteTime
    $fileOwner = (Get-Acl $filePath).Owner
    
    Add-Content -Path "log.csv" -Value "$filePath, $fileSize, $lastModified, $fileOwner"
} else {
    $errorDetails = "File not found: $filePath - $(Get-Date)"
    Add-Content -Path "error.log" -Value "$errorDetails"
}
```