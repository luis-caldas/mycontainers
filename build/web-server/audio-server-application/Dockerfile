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
RUN git clone "https://github.com/luis-caldas/web-audio-server-application" /web

# Change to the project folder
WORKDIR /web

# Expose all needed ports
EXPOSE 80 443

# Start the command
ENTRYPOINT ["sh", "-c"]

# Copy the start file to the image
COPY web-start /usr/bin/web-start

# Start the application
CMD ["web-start"]
