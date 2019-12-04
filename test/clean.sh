#!/bin/bash

set -e

docker container stop nsd || true
docker container rm --volumes nsd || true
docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
