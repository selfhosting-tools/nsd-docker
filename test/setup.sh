#!/bin/bash

set -e

# Build Docker image
docker build --no-cache -t selfhostingtools/nsd-docker:latest .

# Create test container
docker run \
    -d \
    --name nsd \
    -v "$(pwd)/test/resources/conf":/etc/nsd \
    -v "$(pwd)/test/resources/zones":/zones \
    -t selfhostingtools/nsd-docker:latest

sleep 2

exit 0
