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
    echo -e "  \033[0;32m✅ CONNECTED\033[0m"
    echo "$site" >> good.txt
  else
    echo -e "  \033[0;31m❌ FAILED\033[0m"
    echo "$site" >> bad.txt
  fi
done

echo ""
echo "Done!"
echo "Working sites saved in good.txt"
echo "Failed sites saved in bad.txt"

