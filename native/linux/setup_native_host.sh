#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: Please specify a browser name (chrome, chromium, or edge)"
    exit 1
fi

browser_name="$1"

# Extension ID
EXTENSION_ID="bdgjbjpdfpejffidohniaomfcekgodbo"

# Name of the native host executable
EXECUTABLE_NAME="GetServerCert"

# Name of the native messaging host
HOST_NAME="uk.co.asantoni64.getservercert"

# Create the manifest JSON content
# Attention to the slash at the end of the chrome-extension URL: it is essential!
MANIFEST_CONTENT="{
  \"name\": \"$HOST_NAME\",
  \"description\": \"Native messaging host for the QWAC Detector WebExtension\",
  \"path\": \"$(readlink -f $EXECUTABLE_NAME)\",
  \"type\": \"stdio\",
  \"allowed_origins\": [
    \"chrome-extension://$EXTENSION_ID/\"
  ]
}"

# Set the appropriate manifest directory
case "$browser_name" in
    "chrome")
        echo "You chose Chrome."
        MANIFEST_DIR="$HOME/.config/google-chrome/NativeMessagingHosts"
        ;;
    "chromium")
        echo "You chose Chromium."
        MANIFEST_DIR="$HOME/.config/chromium/NativeMessagingHosts"
        ;;
    "edge")
        echo "You chose Edge."
        MANIFEST_DIR="$HOME/.config/microsoft-edge/NativeMessagingHosts"
        ;;
    *)
        echo "Invalid browser name. Please specify 'chrome', 'chromium', or 'edge'."
        exit 1
        ;;
esac

# Create the manifest directory if it doesn't exist
mkdir -p "$MANIFEST_DIR"

# Create the manifest file
MANIFEST_FILE="$MANIFEST_DIR/${HOST_NAME}.json"
echo "$MANIFEST_CONTENT" > "$MANIFEST_FILE"

echo "Manifest file created at: $MANIFEST_FILE"
