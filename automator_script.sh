#!/bin/bash

# Check if Stremio exists
if [ ! -d "/Applications/Stremio.app" ]; then
    osascript -e 'display dialog "Stremio.app not found in Applications folder. Please install it first and do NOT open it before running this fix." buttons {"OK"} default button "OK" with icon stop'
    exit 1
fi

# Request password upfront with explanation
osascript -e 'display dialog "This will fix Stremio launch issues. You will be prompted for your Mac password." buttons {"Continue", "Cancel"} default button "Continue"'

if [ $? -ne 0 ]; then
    exit 1
fi

# Run the fix commands
osascript -e 'do shell script "xattr -cr /Applications/Stremio.app && find /Applications/Stremio.app -name \"._*\" -delete && find /Applications/Stremio.app -name \".DS_Store\" -delete && codesign --force --deep --sign - /Applications/Stremio.app" with administrator privileges'

if [ $? -eq 0 ]; then
    osascript -e 'display dialog "Stremio has been fixed! You can now open it normally." buttons {"OK"} default button "OK" with icon note'
else
    osascript -e 'display dialog "The fix failed. Try this:\n\n1. Delete Stremio.app from Applications\n2. Download a fresh copy of Stremio\n3. Drag it to Applications (DO NOT OPEN IT)\n4. Run this fix tool again" buttons {"OK"} default button "OK" with icon caution'
fi