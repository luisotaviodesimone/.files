Clear-Host

$customThemePath = "$HOME\scoop\apps\oh-my-posh\current\themes\CUSTOM_THEME.omp.json"
  
if (-not (Test-Path $customThemePath)) {
  Copy-Item $HOME\.files\terminal\my_custom_theme.omp.json $customThemePath
}

oh-my-posh --init --shell pwsh --config $customThemePath | Invoke-Expression

# Import/ Enable features
Enable-PoshTooltips 
Import-Module Terminal-Icons 

# Set navigational functions
function .. { set-location "../" }
function ~ { set-location "~" }
function profile { set-location $home/Documents/WindowsPowerShell }
function themes { set-location ~\AppData\Local\Programs\oh-my-posh\themes }
function wtSettings { set-location "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState" }

# Removing alias (curl alias for Invoke-Web-Request)
if (Test-Path alias:curl) {
  Remove-Item alias:curl
}

# Neovim directory and configuration file
Set-Variable -Name "VIMCONFIG" -Value $HOME\AppData\Local\nvim\init.vim
Set-Variable -Name "VIMDIRECTORY" -Value $HOME\AppData\Local\nvim
Set-Variable -Name "TERMINAL_HISTORY" -Value (Get-PSReadlineOption).HistorySavePath
Set-Variable -Name "HOSTS_FILE" -Value "C:\Windows\System32\Drivers\etc\hosts"

# Check this later
Set-Variable -Name "GIT_SSH" -Value "C:\Windows\System32\OpenSSH\ssh.exe"

# Set Aliases functions
function Get-GitStatus { & git status $args }
function Open-Pr { & gh pr create -w -a "@me" $args }
function Get-Version { Get-Host | Select-Object Version }
function Request-ChildItem { Get-ChildItem -Force }
function Invoke-WhichEquivalent { (Get-Command $args -ErrorAction SilentlyContinue).Source }

# Setting new aliases
Set-Alias curl curl.exe
Set-Alias vim nvim
Set-Alias which Invoke-WhichEquivalent
Set-Alias psversion Get-Version
Set-Alias la Request-ChildItem
Set-Alias lods $HOME\Documents\GitHub\my-powershell-cli\cli.ps1
Set-Alias glods $HOME\Documents\Pessoal\scripts-go\my-go-cli\main.exe
Set-Alias k kubectl

# Setting github aliases
Set-Alias gst -Value Get-GitStatus
Set-Alias ghpr -Value Open-Pr

# Shows navigable menu of all options when hitting Tab
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for Arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -MaximumHistoryCount 16384
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
