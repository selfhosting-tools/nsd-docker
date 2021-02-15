#!/bin/sh

set -eux

# Declare variables to be compilant with shellcheck
UID=$UID
GID=$GID

chown -R "$UID":"$GID" /var/db/nsd /tmp

echo "(!) This image is **DEPRECATED**, see [The-Kube-Way/nsd](https://github.com/The-Kube-Way/nsd)"

exec /sbin/tini -- nsd -u "$UID.$GID" -P /tmp/nsd.pid -d
