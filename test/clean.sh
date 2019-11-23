#!/bin/bash

set -e

docker container stop nsd_unsigned nsd_default || true
docker container rm --volumes nsd_unsigned nsd_default || true
docker images --quiet --filter=dangling=true | xargs --no-run-if-empty docker rmi
