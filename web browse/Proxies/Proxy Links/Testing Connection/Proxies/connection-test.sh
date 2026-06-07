#!/bin/bash

# Ask user to paste sites (one per line), end with Ctrl+D
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
    echo "  ✅ CONNECTED"
    echo "$site" >> good.txt
  else
    echo "  ❌ FAILED"
    echo "$site" >> bad.txt
  fi
done

echo ""
echo "Done!"
echo "Working sites saved in good.txt"
echo "Failed sites saved in bad.txt"
