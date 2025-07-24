```powershell
$installedApps = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*, HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion
$knownCVEs = @("CVE-2021-1234", "CVE-2021-5678", "CVE-2021-9012")  # Add CVEs from URL or file

foreach ($app in $installedApps) {
    Write-Host "Scanning $($app.DisplayName) version $($app.DisplayVersion)"
    $cveMatch = $knownCVEs | Where-Object { $_ -in $app.DisplayName }

    if ($cveMatch) {
        Write-Host "Found CVE $cveMatch in $($app.DisplayName) version $($app.DisplayVersion)"
    } else {
        Write-Host "No known CVEs found in $($app.DisplayName) version $($app.DisplayVersion)"
    }
}
```