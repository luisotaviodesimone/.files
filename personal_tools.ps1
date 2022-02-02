Write-Output "The following personal tools will be installed"
Write-Output chrome spotify whatsapp notion discord ' '

Read-Host -Prompt "Do you wish to continue? Yes(enter) No(ctrl+c)"

choco install googlechrome -y
choco install spotify -y
choco install whatsapp -y
choco install notion -y
choco install discord.install -y
