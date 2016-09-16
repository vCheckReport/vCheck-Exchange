$Title = "Exchange Component Status"
$Header =  "Exchange Component Status"
$Comments = "Exchange Component Status where State is not 'Active'"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$ExServers | Get-ServerComponentState | `
   Where-Object {$_.State -ne "Active"} | `
   Select ServerFqdn, Component, State
