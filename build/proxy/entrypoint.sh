#!/usr/bin/env bash

# Variables

# SSL
cert_path_now="${CERT_PATH:-/ssl/cert.pem}"
key_path_now="${KEY_PATH:-/ssl/key.pem}"

# Addressing
listen_now="${LISTEN_PORT:-443}"
port_now="${TARGET_PORT:-80}"
address_now="${TARGET_ADDRESS:-localhost}"

# Send to File

cat > /etc/nginx/conf.d/default.conf << EOL
server {
    listen ${listen_now} ssl http2;
    server_name _;
    ssl_certificate ${cert_path_now};
    ssl_certificate_key ${key_path_now};
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains; preload";
    location / {
        proxy_set_header Host \$host:\$server_port;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Port \$server_port;
        proxy_set_header X-Forwarded-Scheme \$scheme;
        proxy_set_header X-Forwarded-Proto \$scheme;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_pass http://${address_now}:${port_now};
    }
    error_page 497 https://\$host:\$server_port\$request_uri;
}
EOL

# Verbose
echo "HTTPS listening on port $listen_now"
echo "While targeting $address_now:$port_now"

# Start NGINX
nginx -g "daemon off;"