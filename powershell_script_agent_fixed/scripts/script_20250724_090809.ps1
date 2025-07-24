```powershell
$inactiveUsers = Search-ADAccount -AccountInactive -TimeSpan 90.00:00:00 | Get-ADUser -Properties department | Select Name, SamAccountName, LastLogonDate, department | Sort department

$inactiveUsers | Export-Csv -Path "C:\path\to\inactive_users.csv" -NoTypeInformation
```