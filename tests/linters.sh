#!/bin/bash

set -e
set -x

shellcheck bin/*.sh test/*.sh

hadolint Dockerfile
