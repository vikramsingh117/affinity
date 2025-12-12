#!/bin/bash

curl -L -s https://www.amfiindia.com/spages/NAVAll.txt \
  | awk -F';' '{ print $4 "\t" $5 }' \
  > nav.tsv

echo "Saved to nav.tsv"
