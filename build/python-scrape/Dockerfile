# vim:set ft=dockerfile:
FROM debian:stable

# Update debian system
RUN apt update && apt upgrade -y

# Install extra packages
RUN apt install -y \
	git \
	cron \
	openssl \
	python3 \
	python3-pip \
	python3-requests

# Set up cron
COPY cronfile /etc/cron.d/cronfile
RUN chmod 0644 /etc/cron.d/cronfile
RUN crontab /etc/cron.d/cronfile
RUN touch /var/log/cron.log

# Update and install pip packages
RUN pip3 install --upgrade \
	bs4 \
	fpdf

# Change workdir to the new package path
WORKDIR /met-weathers

# Clone the package
ADD https://api.github.com/repos/luis-caldas/get-weathers/git/refs/heads/master version.json
RUN git clone https://github.com/luis-caldas/get-weathers .

# Initialize the weaters app
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
