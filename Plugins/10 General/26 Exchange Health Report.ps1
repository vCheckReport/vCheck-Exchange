$Title = "Exchange Health Report"
$Header =  "Exchange Health Report"
$Comments = "Server health reports where AlertValue is not 'Healthy' and State not 'NotApplicable'"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$ExServers | Where-Object {$_.IsE14OrLater } | ForEach-Object { Get-HealthReport -identity $_ } | `
   Where-object {$_.alertvalue -ne "Healthy" -and $_.State -ne "NotApplicable" } | `
   Select-Object Server, Identity, Alertvalue, State
