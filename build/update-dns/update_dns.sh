#!/bin/sh -e

# Print the received key
echo "$KEY"

# Cache files
IP_FILE="/var/cache/dns_updater/ipaddress"
KEY_FILE="/var/cache/dns_updater/alphanumeric"

# Extract the current IP
CURRENT_IP="$(/usr/bin/host myip.opendns.com | grep "has address" | cut -d ' ' -f 4)"
REGISTERED_IP="Unknown"

# Check if the key is cached or not
if [ -e "$KEY_FILE" ]; then
	KEY="$(cat "$KEY_FILE")"
elif [ -n "$KEY" ]; then
	echo "$KEY" > "$KEY_FILE"
else
	echo "KEY must be set on first start."
	exit 1
fi

# Check if the IP is cached
if [ -e "$IP_FILE" ]; then
	REGISTERED_IP="$(cat "$IP_FILE")"
fi

# Compare to see if the IPs changed
# If yes, update the DNS entry
if [ ! "$CURRENT_IP" = "$REGISTERED_IP" ]; then

	# Update it
	echo "Updating IP address from $REGISTERED_IP to $CURRENT_IP ..."
	curl -s -k "http://freedns.afraid.org/dynamic/update.php?""${KEY}"

	# Update the cache file with the IP as well
	echo "$CURRENT_IP" > "$IP_FILE"

fi
 
