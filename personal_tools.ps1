$personalTools = @('googlechrome', 'whatsapp', 'notion', 'discord', 'slack', 'github-desktop', 'authy-desktop')
Write-Output "The following personal tools will be installed"
Write-Output $personalTools

Read-Host -Prompt "Do you wish to continue? Yes(enter) No(ctrl+c)"

foreach ($personalTool in $personalTools) {
  Write-Output "Installing $personalTool"
  choco install $personalTool -y
}


Write-Output "The following personal tools were installed"
Write-Output $personalTools
