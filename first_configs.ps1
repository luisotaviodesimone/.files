# Installing chocolotay package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Installing the following tools
choco install git.install nvm oh-my-posh vscode

# Adding my custom theme (similar to patricksvensson)
cp my_custom_theme.omp.json  ~\AppData\Local\Programs\oh-my-posh\themes\CUSTOM_THEME.omp.json

# Creating symbolic links for the .gitconfig and the powershell profile
New-Item -ItemType SymbolicLink -Force -Path "~/.gitconfig" -Target ".gitconfig"
New-Item -ItemType SymbolicLink -Force -Path $profile -Target "profile.ps1"
