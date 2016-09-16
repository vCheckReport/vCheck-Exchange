$Title = "ActiveSync Devices by DeviceAccessState"
$Header =  "ActiveSync Devices by DeviceAccessState"
$Comments = "Summary of ActiveSync devices and state"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

$MobileDevices | Group-Object DeviceAccessState | Sort-Object Count -Descending |  Select Count, Name
