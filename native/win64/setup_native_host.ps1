# Get the directory of the script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Get the full path of the native application (assuming it's in the same directory as the script)
$nativeAppPath = Join-Path $scriptPath "GetServerCert.exe"

# Define the name of your native messaging host (this should match what's in your extension)
$hostName = "uk.co.asantoni64.getservercert"

# Create the manifest content
$manifestContent = @{
    name = $hostName
    description = "Native messaging host for the QWAC Detector WebExtension"
    path = $nativeAppPath
    type = "stdio"
    allowed_origins = @(
        "chrome-extension://bdgjbjpdfpejffidohniaomfcekgodbo/"
        "chrome-extension://kkeppdgmekpkohgdppcejgfbojdkdkcb/"
    )
} | ConvertTo-Json

# Define the manifest file path
$manifestPath = Join-Path $scriptPath "$hostName.json"

# Write the manifest file
$manifestContent | Out-File -FilePath $manifestPath -Encoding utf8

# Define the registry key path for Chrome
$chromeRegistryKeyPath = "HKCU:\Software\Google\Chrome\NativeMessagingHosts\$hostName"

# Create the registry key and set the default value to the manifest path
New-Item -Path $chromeRegistryKeyPath -Force | Out-Null
Set-ItemProperty -Path $chromeRegistryKeyPath -Name "(Default)" -Value $manifestPath

Write-Host "Native messaging host has been set up successfully."
Write-Host "Manifest file created at: $manifestPath"
Write-Host "Registry key created at: $chromeRegistryKeyPath"
