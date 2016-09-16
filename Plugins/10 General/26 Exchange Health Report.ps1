$Title = "Exchange Health Report"
$Header =  "Exchange Health Report"
$Comments = "Server health reports where AlertValue is not 'Healthy' and State not 'NotApplicable'"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$ExServers | Where {$_.IsE14OrLater } | Foreach { Get-HealthReport -identity $_ } | `
   Where-object {$_.alertvalue -ne "Healthy" -and $_.State -ne "NotApplicable" } | `
   Select Server, Identity, Alertvalue, State
