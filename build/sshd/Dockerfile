# Get the latest node with alpine
FROM debian:latest

# Update and get basic programs
RUN apt update && apt upgrade -y && apt install -y openssh-server

# Make privileged folder for sshd
RUN mkdir /run/sshd

# Get arguments
ARG USER
ARG PASSWORD

# Add user
RUN useradd -ms /bin/bash ${USER}

# Set users password
RUN echo "${USER}:${PASSWORD}" | chpasswd

# Start the application
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
