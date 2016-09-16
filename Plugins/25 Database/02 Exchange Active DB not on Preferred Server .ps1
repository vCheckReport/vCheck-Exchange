$Title = "Exchange Active DB Not on Preferred Server"
$Header =  "Exchange Active DB Not on Preferred Server"
$Comments = "Exchange  Active DB Not on Preferred Server"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$Databases | Where {( $_.ActivationPreference | Where { $_.Value -eq 1 }).Key.name -ne $_.Server} | `
   Select Identity, Server, @{Name="ActivationPreference";Expression={($_.ActivationPreference | Select -expandproperty Key) -join ", "}}
