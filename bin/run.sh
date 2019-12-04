#!/bin/sh

if [ ! -f /etc/nsd/nsd_server.pem ]; then
  nsd-control-setup
fi

# Declare variables to be compilant with shellcheck
UID=$UID
GID=$GID

exec /sbin/tini -- nsd -u "$UID.$GID" -P /tmp/nsd.pid -d
