#!/bin/sh

set -e
set -x

# Deprecation warning
echo "DEPRECATION WARNING: latest tag won't be updated anymore"
echo "Please check https://github.com/selfhosting-tools/nsd-docker"

# Copy config from /config if it exists
if [ -e /config/nsd.conf ]; then
  cp /config/nsd.conf /etc/nsd
fi

if [ ! -f /etc/nsd/nsd_server.pem ]; then
  nsd-control-setup
fi

# Declare variables to be compilant with shellcheck
UID=$UID
GID=$GID

chown -R "$UID":"$GID" /var/db/nsd /etc/nsd /zones /tmp

exec /sbin/tini -- nsd -u "$UID.$GID" -P /tmp/nsd.pid -d
