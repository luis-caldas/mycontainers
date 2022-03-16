# vim:set ft=dockerfile:
FROM debian:stable

# Install some packages needed for extra asterisk functionality
RUN apt update && apt upgrade -y

# Install extra packages for asterisk
RUN apt install -y \
    perl \
    libwww-perl \
    liblwp-protocol-https-perl \
    sox \
    mpg123 \
    wget

# Install asterisk from the apk
RUN apt install -y \
    asterisk \
    asterisk-core-sounds-en \
    asterisk-moh-opsound-g722 \
    asterisk-moh-opsound-gsm \
    asterisk-moh-opsound-wav

# Install googletts and fix its permission
COPY app/googletts.agi /usr/share/asterisk/agi-bin/googletts.agi

# Install songs
COPY app/songs /usr/share/asterisk/songs

# Install my configuration files
COPY app/conf /etc/asterisk
COPY app/phoneprov /var/lib/asterisk/phoneprov

# Initialize it
CMD ["asterisk", "-T", "-p", "-vvv", "-ddd", "-f"]
