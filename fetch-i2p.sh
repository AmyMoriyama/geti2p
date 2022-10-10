#!/bin/bash
###########################################
## Bash script(s) to fetch I2P 
##
## Deps: 
##
## Be sure to accept the license file.
##
###########################################

# Is Java installed?
if which java >/dev/null ; then
  echo "Java installed, proceeding"
else
  echo "Java NOT installed!"
  exit 2
fi


# Let's do this
VAR=$(curl -s "https://geti2p.net/en/download" | grep 'a class="default"' | grep 'jar' | cut -d"/" -f4-8)
VAR2=$(echo "$VAR" | cut -d"/" -f1)
VAR3=$(echo "$VAR" | cut -d"/" -f4-5 | sed "s|no/|no/releases/$VAR2/|")

echo ""
echo "Downloading..."
wget -4 -q --show-progress "https://$VAR3"

VAR4=$(ls i2pinstall*.jar)

echo ""
echo "Extracting..."
while read file; do java -jar ./$VAR4 -console; done < .args >> /dev/null 2>&1

rm "./$VAR4"

echo ""
echo "All done!"
