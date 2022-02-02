# Installing chocolotay package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Installing the following choco packages
choco install vscode -y
choco install git.install -y
choco install nvm -y
choco install oh-my-posh -y

# Adding my custom theme (similar to patricksvensson)
cp my_custom_theme.omp.json  ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json

# Creating symbolic links for the .gitconfig and the powershell profile
New-Item -ItemType SymbolicLink -Force -Path "~/.gitconfig" -Target ".gitconfig"
New-Item -ItemType SymbolicLink -Force -Path $profile -Target "profile.ps1"

. $profile

Write-Output "The following tools will be installed"
Write-Output node yarn ' '

Read-Host -Prompt "Do you wish to continue? Yes(Enter) No(ctrl+c)"

nvm install 14.19.0
nvm use 14.19.0

Write-Output "You now have nodejs installed on your machine"
