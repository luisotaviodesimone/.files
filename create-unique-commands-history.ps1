Set-Variable -Name "TextFile" -Value $TERMINAL_HISTORY

$text = Get-Content $TextFile -Raw

$result = $text.Split("`r`n")

$result | Sort-Object | Get-Unique | Out-File ConsoleHost_history_no_repeat.txt
