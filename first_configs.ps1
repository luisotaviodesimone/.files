#Requires -RunAsAdministrator
$ErrorActionPreference = "continue"

$major, $minor = $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor

# Check if version used to script is 5.1
if ($major -ne 5 -and $minor -ne 1) {
  # Re-launch as version 5 if we're not already
  Write-Host "Now trying to run the script on powershell 5.1"
  powershell -Version 5.1 iwr -useb https://raw.github.com/luisotaviodesimone/.files/master/first_configs.ps1 | Invoke-Expression
  exit
}

# Installs PSModules
Install-Module -Name PSReadLine -Force
Install-Module -Name z -Force -AllowClobber
Install-Module -Name Terminal-Icons -Force

# Installing chocolotay package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Installing scoop package manager in Administrator mode
Invoke-WebRequest -useb get.scoop.sh -Outfile 'install.ps1'
. .\install.ps1 -RunAsAdmin
Remove-Item .\install.ps1

Write-Output "The following tools will be installed:"
$devTools = @('git', 'oh-my-posh', 'nvm', 'gcc', 'neovim', 'sudo', 'gh', 'vscode', 'vcredist2022')
Write-Output $devTools

scoop bucket add extras
# Installing the development tools with scoop
ForEach ($tool in $devTools) {
  scoop install $tool
}

# Insert git clone here to guarantee below files existance
$dotFilesPath = "$HOME\.files" # Name of your dotfiles directory

git clone https://github.com/luisotaviodesimone/.files $dotFilesPath

# Adding my custom theme (similar to patricksvensson) and installing fonts
New-Item -ItemType SymbolicLink -Force -Path ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json -Target $dotFilesPath\terminal\my_custom_theme.omp.json
. $dotFilesPath\fonts\install_fonts.ps1

New-Item -ItemType SymbolicLink -Force -Path $HOME/.gitconfig -Target $dotFilesPath\.gitconfig
New-Item -ItemType SymbolicLink -Force -Path $PROFILE -Target $dotFilesPath\profile.ps1
New-Item -ItemType SymbolicLink -Force -Path $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target $dotFilesPath\profile.ps1
New-Item -ItemType SymbolicLink -Force -Path $HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Target $dotFilesPath\profile.ps1

. $PROFILE

Write-Output "The following tools will be installed"
Write-Output node yarn ' '

nvm install 16

. $PROFILE

Write-Output "You now have nodejs installed on your machine"

Write-Output "The following tools will be installed"
Write-Output typescript yarn

npm i -g typescript
npm i -g yarn

