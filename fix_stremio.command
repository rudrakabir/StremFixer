#!/bin/bash
cd "$(dirname "$0")"

echo "=== Stremio Fix Tool ==="
echo ""
echo "This will fix Stremio launch issues."
echo "You'll be asked for your password."
echo ""
read -p "Press Enter to continue or Ctrl+C to cancel..."

sudo xattr -cr /Applications/Stremio.app
find /Applications/Stremio.app -name "._*" -delete
find /Applications/Stremio.app -name ".DS_Store" -delete
sudo codesign --force --deep --sign - /Applications/Stremio.app

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Done! You can now close this window and open Stremio."
else
    echo ""
    echo "⚠️  The fix failed. Try this:"
    echo ""
    echo "1. Delete Stremio.app from Applications folder"
    echo "2. Download a fresh copy of Stremio"
    echo "3. Drag it to Applications (DO NOT OPEN IT!)"
    echo "4. Run this fix tool again"
fi

echo ""
read -p "Press Enter to close..."