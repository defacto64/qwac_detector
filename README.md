# QWAC Detector
An experimental WebExtension to detect, validate, and display QWACs (Qualified Website Authentication Certificates) according to Approach #1 of ETSI TS 119 411-5.

⚠**This is NOT production-grade software!**

I developed this WebExtension in (some of) my spare time, __just for fun__.

This software is NOT bug-free, is NOT optimized, and is NOT supported. It may NOT always be accurate or reliable. I did NOT care about privacy issues (but I don't think there are any). This software may cause your browser to become unresponsive or to crash. And it could get even worse if it's your bad day! Of course I'm exaggerating, but you never know. If you decide to use this software, or just give it a try, you do it AT YOUR OWN RISK.

To date, this WebExtension only works with Chromium-based browsers. I also developed a similar add-on for Firefox, but for now I am not sharing it.

## Specifications
* Retrieve the web server's TLS certificate (only for the main frame).
* Parse the certificate and extract some basic information from it.
* Check if the certificate is a QWAC (based on QcStatements).
* Lookup certificate into the EU Trust Services Lists.
* Check if the issuing CA is an active QTSP enabled for QWACs.
* Make QWAC information available to the popup window.
* Enable the clickable EU Trust Mark icon in the toolbar.

## How to install
You can install this WebExtension by opening the following link: xxxxxxxxxxx

However,  this WebExtension only works in conjunction with the GetServerCert native application, which you can downbload from here. Save the GetServerCert.exe wherever you like on yur PC. If you later move it somewhere else, you'll have to re-register it.

In order to register the GetServerCert native application, so the browser will find it, open PowerShell and change directory to where you put the .exe file, the give the following command:
```pwsh
powershell.exe -ExecutionPolicy Bypass -File setup_native_host.ps1
```
Do not worry: that script is absolutely harmless.

## Credits
This WebExtensions uses the following third-party libraries and/or services:
* The PKI.js library (https://pkijs.org)
* The PV Certificate Viewer (https://github.com/PeculiarVentures/pv-certificates-viewer)
* The Trusted List Browser's API (https://eidas.ec.europa.eu/efda/swagger-ui/index.html)

