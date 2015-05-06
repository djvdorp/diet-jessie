#!/bin/sh

# Package declarations:
## 0. Bare essentials
ESSENTIALS="bash curl wget axel screen htop nmon"

## 1. Desktop Environment and Window Manager
DESKTOP_ENV="xorg i3 lightdm"



cat > /etc/apt/sources.list <<EOF
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

# jessie-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
EOF
