# diet-jessie
Debian 8: the light way.

## Where does this start?
The starting point for this installation is a clean Debian 8 (Jessie) netinstall with only these two options selected:

* OpenSSH server
* Standard system utilities

This does, however, not mean that it is only compatible with Debian 8 (Jessie). As long as the package names in the list below are installable via apt-get/aptitude on your distribution, it might probably work just as well on other Debian versions and/or Debian-derivatives like Ubuntu, Linux Mint etc.

## How do I use this?
After reading the starting point for this installation, it is pretty easy to setup your system using Diet Jessie. Assuming that your freshly-installed device has an active internet connection, you can just do these three steps (as root):


```
# wget https://raw.githubusercontent.com/djvdorp/diet-jessie/master/setup.sh
# chmod +x setup.sh
# ./setup.sh
```

## What does this install?
Diet Jessie tries to supply you with a very tiny and productive setup, without all the bloatware featured with a full desktop setup.

The packages installed are divided into the following groups:

### 0. Bare essentials
- etckeeper
- aptitude
- bash 
- curl 
- wget 
- axel 
- screen 
- htop 
- nmon 
- fail2ban 
- ack-grep 
- stterm 
- sudo

### 1. Desktop Environment and Window Manager
- xorg 
- i3 
- i3status 
- suckless-tools 
- lightdm 
- xautolock

### 2. Networking
- wicd-curses

### 3. Audio
- alsa-base 
- alsa-utils 
- pulseaudio

### 4. Browsers
- iceweasel 
- chromium

### 5. Multimedia
- vlc 
- feh 
- gpicview 
- evince 
- scrot 
- imagemagick

### 6. File Management
- pcmanfm 
- mc 
- ranger 
- xarchiver

### 7. Editors
- nano
- vim
- geany

### 8. Compression
- zip 
- rar 
- unzip 
- unrar 
- gzip 
- tar 
- p7zip-full

### 9. Email
- mail-notification 
- icedove

### 10. Version Control
- git 
- subversion 
- tig

### 11. Miscellaneous
- dunst 
- unclutter 
- parcellite
