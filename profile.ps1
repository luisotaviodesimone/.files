clear
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json | Invoke-Expression

# Import/ Enable features
Enable-PoshTooltips
Import-Module Terminal-Icons

# Set navigational functions
function .. { set-location "../"}
function ~ { set-location "~"}
function profile { set-location $home/Documents/WindowsPowerShell}
function themes { set-location ~\AppData\Local\Programs\oh-my-posh\themes}
function wtSettings { set-location "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"}

# Removing alias (curl alias for Invoke-Web-Request)
if (Test-Path alias:curl) {
	Remove-Item alias:curl
}

# Setting new aliases
Set-Alias curl curl.exe
Set-Alias vim nvim

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
