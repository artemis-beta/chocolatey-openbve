$ErrorActionPreference = 'Stop';
$installPath = "$env:ProgramFiles\OpenBve"

Remove-Item -Recurse $installPath
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x64).lnk"
Remove-Item "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\OpenBve (x86).lnk"

#Remove from Path
$Environment = [System.Environment]::GetEnvironmentVariable("Path", "User")
$Environment = $Environment.Replace("$installPath", "")
[System.Environment]::SetEnvironmentVariable("Path", $Environment, "User")