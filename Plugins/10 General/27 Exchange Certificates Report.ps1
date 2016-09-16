# Start of Settings
# Show certs expiring within how many days
$expiringDays = 30
# End of Settings

$ExServers | Where {$_.IsE14OrLater } | Foreach { Get-ExchangeCertificate -Server $_.Name } | Where { $_.NotAfter -le (Get-Date).AddDays($expiringDays)} | Select Subject, Services, NotAfter, NotBefore

$Title = "Exchange Certificate Report"
$Header =  "Exchange Certificate Report"
$Comments = "Certificates expiring in next $($expiringDays) days"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"
