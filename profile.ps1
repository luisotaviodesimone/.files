clear
oh-my-posh --init --shell pwsh --config ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json | Invoke-Expression


# Set navigational functions
function .. { set-location "../"}
function ~ { set-location "~"}
function GitHub { set-location "E:/GitHub"}
function profile { set-location "~/OneDrive/Documentos/WindowsPowerShell"}
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
