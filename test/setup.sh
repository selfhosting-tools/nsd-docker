#!/bin/bash

set -e

# Build Docker image
docker build --no-cache -t selfhostingtools/nsd-docker:latest .

# Create test containers
docker run \
    -d \
    --name nsd_unsigned \
    -v "$(pwd)/test/resources/conf":/etc/nsd \
    -v "$(pwd)/test/resources/zones":/zones \
    -t selfhostingtools/nsd-docker:latest

docker run \
    -d \
    --name nsd_default \
    -v "$(pwd)/test/resources/conf":/etc/nsd \
    -v "$(pwd)/test/resources/zones":/zones \
    -t selfhostingtools/nsd-docker:latest

sleep 2

# Set up DNSSEC-signed zone
docker exec nsd_default keygen example.org
docker exec nsd_default signzone example.org
