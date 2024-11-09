﻿
$ErrorActionPreference = 'Stop';
$checksum = "a43ea9e202313ed7c27cbb70476267a555a21e0e3789f77104edec6942ba4b62"
$repository = "leezer3/OpenBve"
$software_name = "OpenBve"

Write-Host "Fetching version '$env:ChocolateyPackageVersion'"

$download_url = "https://github.com/$repository/releases/download/$env:ChocolateyPackageVersion/OpenBVE-$env:ChocolateyPackageVersion.zip"
$toolsDir = "$env:ProgramFiles\$software_name"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  unzipLocation  = $toolsDir
  url            = $download_url
  softwareName   = $software_name
  checksum       = $checksum
  checksumType   = 'sha256'
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

$exe_path_64 = "$toolsDir\$software_name.exe"
$exe_path_32 = "$toolsDir\$software_name-32.exe"
Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyPath -PathToInstall $toolsDir -PathType "User"

Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x64).lnk" -TargetPath "$exe_path_64" -IconLocation $toolsDir\Data\icon.ico
Install-ChocolateyShortcut -ShortcutFilePath "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x86).lnk" -TargetPath "$exe_path_32" -IconLocation $toolsDir\Data\icon.ico

Update-SessionEnvironment
