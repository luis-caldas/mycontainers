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

# Change to the project folder
WORKDIR /web

# Copy the redirector
COPY app /web

# Expose all needed ports
EXPOSE 80

# Start the command
CMD ["redirect.js"]
