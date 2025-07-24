```powershell
$inactiveDays = 90
$users = Get-ADUser -Filter * -Properties Name, SamAccountName, Department, LastLogonDate | Where-Object {($_.Enabled -eq $true) -and ($_.LastLogonDate -lt (Get-Date).AddDays(-$inactiveDays))}
$users | Sort-Object Department | Export-Csv -Path "C:\path\to\output.csv" -NoTypeInformation
```