# Get the latest node with alpine
FROM debian:latest

# Update and get basic programs
RUN apt update && apt upgrade -y && apt install -y software-properties-common

# Set the installation to non interactive
ENV DEBIAN_FRONTEND noninteractive

# Update yet again
RUN apt update

# Install all needed dependencies
RUN apt install -y \
    xorg

# Return the frontend to normal
ENV DEBIAN_FRONTEND text

# Install debug applications
RUN apt install -y tmux vim htop less

# Install window manager
# RUN apt install -y openbox

# Prepare to install steam
RUN apt-add-repository non-free
RUN dpkg --add-architecture i386
RUN apt update && apt upgrade -y

# Install open source libraries
RUN apt install -y libgl1:i386 mesa-vulkan-drivers:i386 mesa-vulkan-drivers

# Finally install steam
RUN echo 2 | apt install -y steam 

# Install audio
RUN apt install -y pulseaudio pavucontrol

# Install openbox
RUN apt install -y openbox

# Install bluetooth stack
RUN apt install -y blueman bluez

# Our default workdir
WORKDIR /steam

# Copy the start file to the image
COPY app/init /steam/init

# Copy the xorg configuration and link it
COPY app/xorg.conf /steam/xorg.conf
RUN ln -s /steam/xorg.conf /etc/X11/xorg.conf

# Copy the xinit file
COPY app/xinitrc /steam/.xinitrc

# Start the application
ENTRYPOINT ["/steam/init"]
