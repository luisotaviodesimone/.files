# $Action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-NonInteractive -NoLogo -NoProfile -File "C:\Users\luiso\.files\commandHistoryBackupTask\history_backup_task.ps1"'
# $Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek WED -At 14:15
# $Settings = New-ScheduledTaskSettingsSet
# $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

# Register-ScheduledTask -TaskName 'Console History GitHub Backup' -InputObject $Task

$Action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument C:\Users\luiso\.files\commandHistoryBackupTask\history_backup_task.ps1


$Trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Saturday -At 20:45:30
$Settings = New-ScheduledTaskSettingsSet
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

Register-ScheduledTask -TaskName 'TaskTest' -InputObject $Task
