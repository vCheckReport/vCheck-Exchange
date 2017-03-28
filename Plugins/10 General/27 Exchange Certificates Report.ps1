# Start of Settings
# Show certs expiring within how many days
$expiringDays = 30
# End of Settings

$ExServers | Where-Object {$_.IsE14OrLater } | ForEach-Object { Get-ExchangeCertificate -Server $_.Name } | Where-Object { $_.NotAfter -le (Get-Date).AddDays($expiringDays)} | Select-Object Subject, Services, NotAfter, NotBefore

$Title = "Exchange Certificate Report"
$Header =  "Exchange Certificate Report"
$Comments = "Certificates expiring in next $($expiringDays) days"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"
