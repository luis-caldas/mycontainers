# My Containers

Collection of containers

#### `example-compose.yaml`

Example of how the containers could be configured with docker-compose

#### `build/`

This folder contains Dockerfiles and needed configuration files for building the my containers

#### `shared/`

This folder contains shared configurations that are mounted volumes on the container and can be accessed with the container running

#### `ssl/`

Put your ssl keys in this folder with the following names:

  - `server.key`
  - `server.crt`
