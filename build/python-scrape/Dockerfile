# vim:set ft=dockerfile:
FROM debian:stable

# Update debian system
RUN apt update && apt upgrade -y

# Install extra packages
RUN apt install -y \
	git \
	cron \
	python3 \
	python3-pip

# Set up cron
COPY cronfile /etc/cron.d/cronfile
RUN chmod 0644 /etc/cron.d/cronfile
RUN crontab /etc/cron.d/cronfile
RUN touch /var/log/cron.log

# Update and install pip packages
RUN pip3 install --upgrade pip3
RUN pip3 install \
	requests \
	fpdf \
	bs4

# Change workdir to the new package path
WORKDIR /met-weathers

# Clone the package
RUN git clone https://github.com/luis-caldas/get-weathers .

# Initialize the weaters app
CMD cron && tail -f /var/log/cron.log
