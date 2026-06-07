# Overview
---
This script allows users to quickly test their internet connectivity to a list of websites.  
It is designed for macOS Terminal and provides clear feedback for each site.

## Requirements
- macOS with Terminal access¹
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
--
## Usage
1. Copy the code below [here](https://github.com/s-p-e-c-k/school-bypass-methods/blob/main/web%20browse/Proxies/Proxy%20Links/Testing%20Connection/Proxies/Testing%20Your%20Connection.md#code-for-terminal)
2. Paste it into your Terminal tool!
3. Paste your list of websites, then press Ctrl+D to finish.

## Output Example
```
Checking https://google.com...
  ✅ CONNECTED
Checking https://github.com...
  ✅ CONNECTED
Checking http://example.org...
  ❌ FAILED
```
---
# Code for Terminal
 ```
cat <<'EOF' > ~/Downloads/connection-test.sh
#!/bin/bash

echo "Paste your list of websites below (one per line), then press Ctrl+D when done:"
sites=()
while read -r site; do
  sites+=("$site")
done

echo ""
echo "Checking connectivity..."
echo ""

# Clear old results
> good.txt
> bad.txt

for site in "${sites[@]}"; do
  echo "Checking $site..."
  if curl -m 5 -s -o /dev/null "$site"; then
    echo -e "  ✅ CONNECTED"
    echo "$site" >> good.txt
  else
    echo -e "  ❌ FAILED"
    echo "$site" >> bad.txt
  fi
done

echo ""
echo "Done!"
echo "Working sites saved in good.txt"
echo "Failed sites saved in bad.txt"
EOF

chmod +x ~/Downloads/connection-test.sh && ~/Downloads/connection-test.sh
```
---
## But wait, what if I don’t have Terminal?¹

This script is designed for macOS, _BUT_, you don't need the built-in MacOS Terminal app!

If you don’t have Terminal available (for example, on a managed school Mac or restricted environment), you have several options:

- **[VS Code Integrated Terminal](ca://s?q=Use_VS_Code_integrated_terminal_on_macOS)**  
  Visual Studio Code includes a built‑in terminal. Open it with `⌘ (Cmd) + backtick` on macOS and run the script directly inside VS Code by pasting it into the terminal! Download from the official site, [code.visualstudio.com](https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal-dmg)

- **[iTerm2](ca://s?q=Install_and_use_iTerm2_on_macOS)**  
  A popular replacement for Terminal with advanced features like split panes, search, and better customization. Download from [iterm2.com](https://iterm2.com).

- **[Hyper](ca://s?q=Use_Hyper_terminal_on_macOS)**  
  A modern, Electron‑based terminal emulator that runs shell scripts just like Terminal. Download from [hyper.is](https://hyper.is)

- **[Alacritty](ca://s?q=Install_Alacritty_terminal_on_macOS)**  
  A GPU‑accelerated terminal emulator that’s fast and lightweight. Download from their [GitHub](https://github.com/alacritty/alacritty/releases/latest/download/Alacritty-v0.17.0.dmg)


⭐️ Creator's Note: I strongly recommend getting Visual Studio Code. It will be very helpful for later projects and tech stuff!

⚠️ Note: Without some form of terminal or shell environment, this script cannot be executed.
---
# Don't ask your administrator for Terminal perms. They'll know you're up to something fishy.
