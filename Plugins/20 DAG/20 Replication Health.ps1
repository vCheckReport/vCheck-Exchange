$Title = "Exchange Replication Health"
$Header =  "Exchange Replication Health"
$Comments = "Result of Test-ReplicationHealth"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# Include healthy results
$IncludeOK = $false
# End of Settings

$ExServers | Where-Object {$_.IsE14OrLater -and $_.IsMailboxServer } | Test-ReplicationHealth | `
   Where-Object { $IncludeOK -or $_.Result.Value -ne "Passed" } | `
   Select-Object Server, Check, CheckDescription, Result

$TableFormat = @{"Result" = @(@{ "-eq 'Passed'"  = "cell,class|healthyText" },
                              @{ "-eq '*FAILED*'"  = "cell,class|criticalText" })}
