# Use latest alpine version
FROM frolvlad/alpine-glibc

# Source code for the server
# https://mednafen.github.io/releases/files/mednafen-server-0.5.2.tar.xz

# Install c++ libraries
RUN apk add libstdc++ libstdc++6

# Copy our configuration to the container
COPY conf /ms

# Change the workdir to a default folder
WORKDIR /ms

# Add the server blob to the workdir
COPY mednafen-server mednafen-server

# Expose all needed ports
EXPOSE 4046

# Start the command
CMD ["./mednafen-server", "conf/standard.conf"]
