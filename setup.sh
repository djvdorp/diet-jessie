#!/bin/sh

# Package declarations:
## 0. Bare essentials
ESSENTIALS="bash curl wget axel screen htop nmon fail2ban nano vim ack-grep rxvt-unicode"

## 1. Desktop Environment and Window Manager
DESKTOP_ENV="xorg i3 i3status suckless-tools lightdm xautolock"

## 2. Networking
NETWORKING="wicd-curses"

## 3. Audio
AUDIO="alsa-base alsa-utils pulseaudio"

## 4. Browsers
BROWSERS="iceweasel chromium"

## 5. Multimedia
MULTIMEDIA="vlc feh gpicview evince scrot imagemagick"

## 6. File Management
FILE_MGMT="pcmanfm mc ranger xarchiver"

## 7. Editors
EDITORS="geany"

## 8. Compression
COMPRESSION="zip rar unzip unrar gzip tar p7zip-full"



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
