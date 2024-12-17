When you download GetServerCert.exe, Windows Defender may warn you that the executable is severely dangerous because it contains the "Trojan:Win32/Wacatac.B!ml" malware, and may even block its download at all. You can rest assured: it's a **false positive**. If MS Edge prevents you from downloading the file, go to your Windows Security settings and set a specific "allow" for this file.

In order to register the GetServerCert native application, so the browser will find it, open the PowerShell prompt and change directory to where you put the .exe file, then give the following command:
```pwsh
powershell.exe -ExecutionPolicy Bypass -File setup_native_host.ps1
```
Do not worry: that script is _absolutely_ harmless.

