# Start of Settings
# How many mailboxes do you want to include in the report. 0=unlimited
$ReportMBs = 20
# End of Settings

if ($reportMBs -gt 0)
{
    $MBStats | Where  {$_.DisconnectDate -eq $null } | Sort-Object TotalItemSize -Descending | Select DisplayName, Database, ItemCount, TotalItemSize -First $ReportMBs
}
else
{
    $MBStats | Where  {$_.DisconnectDate -eq $null } | Sort-Object TotalItemSize -Descending | Select DisplayName, Database, ItemCount, TotalItemSize
}

$Title = "Largest Exchange Mailboxes"
$Header =  "Largest Exchange Mailboxes"
$Comments = ("Largest {0} mailboxes in the Exchange environment" -f $ReportMBs)
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"