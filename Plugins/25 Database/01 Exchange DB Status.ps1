$Title = "Exchange DB Status"
$Header =  "Exchange DB Status"
$Comments = "Exchange Databases not Mounted or Healthy"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# Do not include these databases on report
$ignoreDatabases = "RDB-"
# End of Settings

ForEach ($Server in ($ExServers | Where {$_.IsE14OrLater -and $_.IsMailboxServer})) {
   Get-MailboxDatabaseCopyStatus -server $Server.Name | `
      Where {$_.Status -ne "Healthy" -and $_.Status -ne "Mounted" -and $_.Name -notmatch $ignoreDatastores } | `
      Select Name, Status, CopyQueueLength, ReplayQueueLength,LastInspectedLogTime, ContentIndexState | `
      Sort-Object Name
}
