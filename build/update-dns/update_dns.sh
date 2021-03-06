#!/bin/sh -e

# Print the received key
echo "$KEY"

# Cache files
KEY_FILE="/var/cache/dns_updater/alphanumeric"

# Check if the key is cached or not
if [ -e "$KEY_FILE" ]; then
	KEY="$(cat "$KEY_FILE")"
elif [ -n "$KEY" ]; then
	echo "$KEY" > "$KEY_FILE"
else
	echo "KEY must be set on first start."
	exit 1
fi

# Update the DNS entry
echo "Updating IP address ..."
curl -s -k "http://freedns.afraid.org/dynamic/update.php?""${KEY}"

 
