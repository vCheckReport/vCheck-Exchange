$Title = "ActiveSync Devices by DeviceModel"
$Header =  "ActiveSync Devices by DeviceModel"
$Comments = "Counts may be slightly off based on the reported Friendly Name"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# Include top x devices
$IncludeDevices = 30
# End of Settings

$TopDevices = $MobileDevices | Group-Object FriendlyName | Sort-Object Count -Descending | Select Count, Name -First ($IncludeDevices-1)
$TopDevices += New-Object PSObject -Property @{"Count" = $MobileDevices.count-($TopDevices | Measure-Object -Sum Count).Sum; "Name"="Other"}

$TopDevices
