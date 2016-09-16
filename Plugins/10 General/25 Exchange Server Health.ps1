$Title = "Exchange Server Health"
$Header =  "Exchange Server Health"
$Comments = "Server health checks in where AlertValue is 'Unhealthy' and CurrentHealthSetState not 'NotApplicable'"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$ExServers  | Where {$_.IsE14OrLater } | Get-ServerHealth | `
   Where-Object {$_.AlertValue -eq "Unhealthy" -and $_.CurrentHealthSetState -ne "NotApplicable" } | `
   Select Server, CurrentHealthSetState,Name, TargetResource, HealthSetName,AlertValue, FirstAlertObservedTime
