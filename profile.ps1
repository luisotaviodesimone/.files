clear
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json | Invoke-Expression

Enable-PoshTooltips

# Set navigational functions
function .. { set-location "../"}
function ~ { set-location "~"}
function profile { set-location $home/Documents/WindowsPowerShell}
function themes { set-location ~\AppData\Local\Programs\oh-my-posh\themes}
function wtSettings { set-location "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"}

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
