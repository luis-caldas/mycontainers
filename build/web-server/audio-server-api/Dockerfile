# Get the latest node with alpine
FROM node:alpine

# Change workdir to the new package path
WORKDIR /nmods

# Install all npm dependencies
RUN npm install \
    express \
    http-server

# Add the previous folder to the node modules path
ENV NODE_PATH /nmods/node_modules

# Change permission of all the files in the nmods dir
RUN chown -R node:node /nmods

# Install git
RUN apk add --update git

# Download the api repo
ADD https://api.github.com/repos/luis-caldas/web-audio-server-api/git/refs/heads/master /version.json
RUN git clone "https://github.com/luis-caldas/web-audio-server-api" /web

# Change to the project folder
WORKDIR /web

# Expose all needed ports
EXPOSE 81 444

# Start the command
CMD ["api.js"]
