# Get latest alpine release
FROM alpine:latest

# Download the needed tools
RUN apk add --update curl bind-tools

# Add the update script
ADD update_dns.sh /bin/

# Add the crontab file
ADD crontab /var/spool/cron/crontabs/root

# Create the cache folder
RUN mkdir /var/cache/dns_updater

# Make the script executable
RUN chmod +x /bin/update_dns.sh

# Create the start command
CMD /bin/update_dns.sh && crond -l 2 -f

