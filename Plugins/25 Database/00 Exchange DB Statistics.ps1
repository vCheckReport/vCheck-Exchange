$Title = "Exchange DB Statistics"
$Header =  "Exchange Database Statistics"
$Comments = "Exchange DB Statistics"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

foreach($Database in $Databases)
{
   if ($Database.DatabaseCreated)
   {
      if ($Database.Mounted)
      {
         $DBStats = $MBStats | Where {$_.Database -eq $Database.Name} | Select @{Name="TotalMB";e={$_.TotalItemSize.value.ToMB()}},@{Name="TotalDeletedMB";e={$_.TotalDeletedItemSize.value.ToMB()}}
         if ($DBStats.Count -gt 0)
         {
            $MBAvgMB = "{0:N3}" -f (($DBStats | Measure-Object -Sum TotalMB).Sum / $DBStats.Count)
            $DelAvgMB = "{0:N3}" -f (($DBStats | Measure-Object -Sum TotalDeletedMB).Sum / $DBStats.Count)

            # Exchange 2010 or above
            $DBSize = ("{0:N3}" -f $Database.DatabaseSize.ToGB())
            $Whitespace = ("{0:N3}" -f ($Database.AvailableNewMailboxSpace.ToBytes() / 1GB))
         }
         else
         {
            $MBAvgMB = "N/A"
            $MBAvgMB = "N/A"
            $DBSize = "Unknown"
            $Whitespace = "Unknown"
         }
      }
      else
      {
         $MBAvgMB = "N/A"
         $MBAvgMB = "N/A"
         $DBSize = "Unknown"
         $Whitespace = "Unknown"
      }

      [pscustomobject]@{
         Server = $Database.Server.Name
         Database = $Database.Name
         "Mailbox Count" = $DBStats.Count
         "Database Size (GB)" = $DBSize
         "WhiteSpace (GB)" = $Whitespace
         "Avg Mailbox Size (MB)" = $MBAvgMB
         "Avg Del Items Size (MB)" = $DelAvgMB
         Mounted = $Database.Mounted
         "Circular Logging" = $Database.CircularLoggingEnabled
         "Last Full Backup" = $Database.LastFullBackup
         "Last Incremental Backup" = $Database.LastIncrementalBackup
      }
   }
}
