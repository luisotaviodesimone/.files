Write-Output "The following personal tools will be installed"
Write-Output chrome whatsapp notion discord slack "github desktop" authy ' '

Read-Host -Prompt "Do you wish to continue? Yes(enter) No(ctrl+c)"

choco install googlechrome -y
choco install whatsapp -y
choco install notion -y
choco install discord.install -y
choco install slack -y
choco install github-desktop -y
choco install authy-desktop -y

Write-Output "The following personal tools were installed"
Write-Output chrome whatsapp notion discord slack "github desktop" authy ' '
