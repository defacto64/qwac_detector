# QWAC Detector
An experimental WebExtension to detect, validate, and display QWACs (Qualified Website Authentication Certificates) according to Approach #1 of ETSI TS 119 411-5.

⚠**This is NOT production-grade software!**

I developed this WebExtension in (some of) my spare time, __just for fun__.

This software is NOT supported. It MAY have bugs. If you decide to use this software, or just give it a try, you do it AT YOUR OWN RISK.


## Compatible browsers

To date, this WebExtension only works with Chromium-based browsers such as Google Chrome and Microsoft Edge. 

I also developed a similar add-on for Firefox, but for now I am not sharing it.

## Compatibile operating systems

For now, this WebExtension works under:
* Windows 10 and 11 (do not know if it works under previous versions, but I expect it to)
* Linux (e.g. Ubuntu)

If I have time and desire, maybe later I will try to port it to macOS as well.

## Specifications
* Retrieve the web server's TLS certificate (only for the main frame).
* Parse the certificate and extract some basic information from it.
* Check if the certificate is a QWAC (based on QcStatements).
* Lookup certificate into the EU Trust Services Lists.
* Check if the issuing CA is an active QTSP enabled for QWACs.
* Make QWAC information available to the popup window.
* Enable the clickable EU Trust Mark icon in the toolbar.

## How to install
You can install this WebExtension by opening the following link: https://chromewebstore.google.com/detail/bdgjbjpdfpejffidohniaomfcekgodbo?authuser=0&hl=en-GB

However, this WebExtension only works in conjunction with the **GetServerCert** native application, which you can download from the [native](native) subdirectory of this project. Save the GetServerCert executable wherever you like on your PC together with the accompanying registration script, then run this latter. If you later move the GetServerCert executable somewhere else, you'll have to re-register it.

## Credits
This WebExtensions uses the following third-party libraries and/or services:
* The PKI.js library (https://pkijs.org)
* The PV Certificate Viewer (https://github.com/PeculiarVentures/pv-certificates-viewer)
* The Trusted List Browser's API (https://eidas.ec.europa.eu/efda/swagger-ui/index.html)

