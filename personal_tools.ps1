$personalTools = @('googlechrome', 'notion', 'discord' , 'dbeaver')
Write-Output "The following personal tools will be installed"
Write-Output $personalTools

Read-Host -Prompt "Do you wish to continue? Yes(enter) No(ctrl+c)"

foreach ($personalTool in $personalTools) {
  Write-Output "Installing $personalTool"
  choco install $personalTool -y
}


Write-Output "The following personal tools were installed"
Write-Output $personalTools

Write-Output "Configure windows terminal settings? Yes(enter) No(ctrl+c)"

New-Item -ItemType SymbolicLink -Force -Path $HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Target $HOME\.files\terminal\settings.json
