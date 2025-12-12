#!/bin/bash

URL="https://www.amfiindia.com/spages/NAVAll.txt"

curl -L -s "$URL" \
  | grep ";" \
  | awk -F';' 'NF >= 5 { print $4 "\t" $5 }' \
  > nav_output.tsv

echo "Saved Scheme Name + NAV to nav_output.tsv"
