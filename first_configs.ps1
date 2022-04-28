#Requires -RunAsAdministrator

# Installs PSModules
Install-Module -Name PSReadLine -AllowPrerelease -Force

# Installing chocolotay package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Installing scoop package manager in Administrator mode
Invoke-WebRequest -useb get.scoop.sh -Outfile 'install.ps1'
. .\install.ps1 -RunAsAdmin
Remove-Item .\install.ps1

Write-Output "The following tools will be installed"
Write-Output vscode git github-cli oh-my-posh nvm neovim ' '

# Installing the following scoop packages
scoop install git
scoop install gh
scoop install nvm
scoop install neovim gcc

# Installing the following choco packages
choco install vscode -y
choco install oh-my-posh -y

# Insert git clone here to guarantee below files existance
$dotFilesPath = "$HOME\.files" # Name of your dotfiles directory

git clone https://github.com/luisotaviodesimone/.files $dotFilesPath

# Adding my custom theme (similar to patricksvensson)
Copy-Item $dotFilesPath\my_custom_theme.omp.json ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json

$major, $minor = $PSVersionTable.PSVersion.Major, $PSVersionTable.PSVersion.Minor
if ($major -ne 5 -and $minor -ne 1) {
  # Re-launch as version 5 if we're not already
  Write-Host "Now Running on PowerShell 5.1"
  powershell -Version 5.1 Write-Host "Creating Symbolic Links";
  New-Item -ItemType SymbolicLink -Force -Path $HOME/.gitconfig -Target $dotFilesPath\.gitconfig ;
  New-Item -ItemType SymbolicLink -Force -Path $PROFILE -Target $dotFilesPath\profile.ps1;
  New-Item -ItemType SymbolicLink -Force -Path $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target $dotFilesPath\profile.ps1
}
else {
  New-Item -ItemType SymbolicLink -Force -Path $HOME/.gitconfig -Target $dotFilesPath\.gitconfig
  New-Item -ItemType SymbolicLink -Force -Path $PROFILE -Target $dotFilesPath\profile.ps1
  New-Item -ItemType SymbolicLink -Force -Path $HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 -Target $dotFilesPath\profile.ps1
}

. $PROFILE

Write-Output "The following tools will be installed"
Write-Output node yarn ' '

nvm install 14.19.0
nvm use 14.19.0

. $PROFILE

Write-Output "You now have nodejs installed on your machine"

Write-Output "The following tools will be installed"
Write-Output typescript yarn

npm i -g typescript
npm i -g yarn

exit
