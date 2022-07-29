$FONTS = 0x14
$Path = ".\fonts"
$objShell = New-Object -ComObject Shell.Application
$objFolder = $objShell.Namespace($FONTS)
$Fontdir = Get-ChildItem $Path
foreach ($File in $Fontdir) {
  if (!($file.name -match "pfb$")) {
    $try = $true
    $installedFonts = @(Get-ChildItem c:\windows\fonts | Where-Object { $_.PSIsContainer -eq $false } | Select-Object basename)
    $name = $File.baseName

    foreach ($font in $installedFonts) {
      $font = $font -replace "_", ""
      $name = $name -replace "_", ""
      if ($font -match $name) {
        $try = $false
      }
    }
    if ($try) {
      $objFolder.CopyHere($File.fullname)
    }
  }
}