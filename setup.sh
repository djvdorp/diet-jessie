#!/bin/sh

# Package declarations:
## 0. Bare essentials
ESSENTIALS="bash curl wget axel screen htop nmon"

## 1. Desktop Environment and Window Manager
DESKTOP_ENV="xorg i3 lightdm"



# Start the actual setup:

apt-get update
apt-get -y install etckeeper
apt-get -y install aptitude

cat > /etc/apt/sources.list <<EOF
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

# jessie-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
EOF

apt-get update
apt-get upgrade
apt-get dist-upgrade

aptitude -y install $ESSENTIALS
aptitude -y install $DESKTOP_ENV
