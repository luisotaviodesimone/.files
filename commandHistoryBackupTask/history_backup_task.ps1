$dotFilesPath = "$HOME\.files\commandHistoryBackupTask"
$consoleHistoryCopy = "$dotFilesPath\ConsoleHost_history.txt"

. $dotFilesPath\create-unique-commands-history.ps1
gh gist edit 6995cd5f61538f67881e2bef26f00a8c $consoleHistoryCopy
Remove-Item $consoleHistoryCopy 