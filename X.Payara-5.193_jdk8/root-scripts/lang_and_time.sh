#!/bin/bash
set -eux

# Set timezone
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Generate locales
locale-gen ${LANG}
