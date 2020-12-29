# vim:set ft=dockerfile:
FROM alpine:latest

# Install some packages needed for extra asterisk functionality
RUN apk add --update \
    perl \
    perl-libwww \
    perl-lwp-protocol-https \
    sox \
    mpg123 \
    wget

# Install asterisk from the apk
RUN apk add --update \
    asterisk \
    asterisk-sample-config \
    asterisk-sounds-en \
    asterisk-sounds-moh

# Install googletts and fix its permission
COPY googletts.agi /var/lib/asterisk/agi-bin/googletts.agi

# Initialize it
CMD ["asterisk", "-T", "-p", "-vvv", "-ddd", "-f"]
