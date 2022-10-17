$dotFilesPath = "$HOME\.files\commandHistoryBackupTask"
$consoleHistoryCopy = "$dotFilesPath\ConsoleHost_history.txt"

. $dotFilesPath\create_unique_commands_history.ps1
$array = gh gist list
foreach ($item in $array) {
  if ($item.contains("My whole console commands history")) {
    $gistToken = $item.substring(0, 32)
    gh gist delete $gistToken 
  }
}

gh gist create $consoleHistoryCopy -d "My whole console commands history"
Remove-Item $consoleHistoryCopy 
