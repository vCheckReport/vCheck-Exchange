$Title = "Exchange DAG Info"
$Header =  "Exchange DAG Info"
$Comments = "Exchange Database Availability Group Info"
$Display = "Table"
$Author = "John Sneddon"
$PluginVersion = 1.0
$PluginCategory = "Exchange"

# Start of Settings
# End of Settings

foreach ($DAG in $DAGs) {
   New-Object PSObject -Property @{
      Name =  $DAG.Name
      Servers = ($dag.Servers | select -ExpandProperty Name) -join ", "
      "Operational Servers" = ($dag.OperationalServers | select -ExpandProperty Name) -join ", "
      "Witness Server" = $DAG.WitnessServer
      "Witness Dir" = $DAG.WitnessDirectory
      "Alt Witness Server" = $DAG.AlternateWitnessServer
      "Alt Witness Dir" = $DAG.AlternateWitnessDirectory
   }
}
