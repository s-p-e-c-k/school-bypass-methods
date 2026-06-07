# Overview

This script allows users to quickly test their internet connectivity to a list of websites.  
It is designed for macOS Terminal and provides clear feedback for each site.

## Requirements
- macOS with Terminal access
- `curl` installed (preinstalled on macOS)
- Basic knowledge of running shell scripts

## How It Works
1. User runs the script in Terminal.
2. Script prompts the user to paste a list of websites (one per line).
3. Each site is tested with a 5‑second timeout.
4. Results are printed in real time:
   - ✅ CONNECTED if the site responds
   - ❌ FAILED if the site cannot be reached
5. Results are saved into two files:
   - `good.txt` → all working sites
   - `bad.txt` → all failed sites

## Usage
1. Copy the code below [here](
2. Run it with:
   ```bash
   bash connection-test.sh

# Code for Terminal
 ```
