# Start of Settings
# Show devices that are have individual block rules?
$ShowBlocked = $false;
# End of Settings

foreach ($AccessRule in $EASAccessRules)
{
    if ($ShowBlocked)
    {
        $MobileDevices | Where {$_.($AccessRule.characteristic) -eq $AccessRule.QueryString} | `
            Select @{Name="User";e={$_.Identity.Parent.Parent.name}}, FriendlyName, DeviceAccessState, @{Name="Rule";e={"{0}={1}" -f $AccessRule.characteristic,  $AccessRule.QueryString}}
    }
    else
    {
        $MobileDevices | Where {$_.($AccessRule.characteristic) -eq $AccessRule.QueryString} | `
            Where {$_.DeviceAccessState -ne "Blocked" } | `
            Select @{Name="User";e={$_.Identity.Parent.Parent.name}}, FriendlyName, DeviceAccessState, @{Name="Rule";e={"{0}={1}" -f $AccessRule.characteristic,  $AccessRule.QueryString}}
    }
}

$TableFormat = @{"DeviceAccessState" = @(@{ "-ne 'Blocked'"  = "Cell,class|critical"; })}

$Title = "ActiveSync Devices breaching access rules"
$Header =  "[count] ActiveSync Devices breaching access rules"
$Comments = "Devices matching ActiveSync device access block rules"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"
