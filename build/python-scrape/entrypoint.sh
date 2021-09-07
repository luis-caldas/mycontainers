printenv | grep "SMTP" > /etc/environment
cron && tail -f /var/log/cron.log

