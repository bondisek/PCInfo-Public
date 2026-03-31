[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$url = "https://github.com/bondisek/PCInfoApp/raw/refs/heads/master/Package/PCInfo.zip"
$zip = "$env:TEMP\PCInfo.zip"
$extractPath = "$env:TEMP\PCInfo"
$exePath = "$extractPath\PCInfo.exe"

# Stažení ZIP
Invoke-WebRequest -Uri $url -OutFile $zip

# Rozbalení
Expand-Archive -Path $zip -DestinationPath $extractPath -Force

# Spuštění a čekání na ukončení
Start-Process $exePath -Wait

# Krátká pauza (pro jistotu)
Start-Sleep -Seconds 2

# Smazání souborů
Remove-Item $zip -Force
Remove-Item $extractPath -Recurse -Force