# Stremio macOS Fix

A one-click solution to fix Stremio launch issues on macOS.

## The Problem

Stremio may fail to launch on macOS due to code signing and file attribute issues. This tool fixes those issues automatically.

## Installation

### Method 1: Automator App (Recommended)

1. Download `Fix Stremio.app.zip` from [Releases](../../releases)
2. Unzip and move `Fix Stremio.app` anywhere you like
3. Double-click to run

### Method 2: Command Line Script

1. Download `fix-stremio.command`
2. Double-click to run (or run from Terminal)

## Usage

1. Make sure Stremio is in your `/Applications` folder
2. **Important:** Do NOT open Stremio before running the fix
3. Run the fix tool
4. Enter your Mac password when prompted
5. Open Stremio normally

## If It Doesn't Work

1. Delete Stremio.app from Applications folder
2. Download a fresh copy of Stremio
3. Drag it to Applications (**DO NOT OPEN IT!**)
4. Run this fix tool again

## What This Does

The tool runs these commands:
```bash
sudo xattr -cr /Applications/Stremio.app
find /Applications/Stremio.app -name "._*" -delete
find /Applications/Stremio.app -name ".DS_Store" -delete
sudo codesign --force --deep --sign - /Applications/Stremio.app
```

## Security Note

This script requires administrator privileges to re-sign the application. You can review the source code in this repository before running.

## License

MIT License - Feel free to use and modify# StremFixer
