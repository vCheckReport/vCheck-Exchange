$Title = "Exchange Disconnected Mailboxes"
$Header =  "Exchange Disconnected Mailboxes"
$Comments = "Exchange Disconnected Mailboxes"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$MBStats | Where { $_.DisconnectDate -ne $null } | `
   Select DisplayName, DatabaseName, DisconnectReason, DisconnectDate, MailboxGUID | Sort DisplayName
