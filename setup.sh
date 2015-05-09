#!/bin/sh

# Package declarations:
### 0. Bare essentials
ESSENTIALS="bash curl wget axel screen htop nmon fail2ban ack-grep stterm sudo"

### 1. Desktop Environment and Window Manager
DESKTOP_ENV="xorg i3 i3status suckless-tools lightdm xautolock"

### 2. Networking
NETWORKING="wicd-curses"

### 3. Audio
AUDIO="alsa-base alsa-utils pulseaudio"

### 4. Browsers
BROWSERS="iceweasel chromium"

### 5. Multimedia
MULTIMEDIA="vlc feh gpicview evince scrot imagemagick"

### 6. File Management
FILE_MGMT="pcmanfm mc ranger xarchiver"

### 7. Editors
EDITORS="nano vim geany"

### 8. Compression
COMPRESSION="zip rar unzip unrar gzip tar p7zip-full"

### 9. Email
EMAIL="mail-notification icedove"

### 10. Version Control
VC="git subversion tig"

### 11. Miscellaneous
MISC="dunst unclutter parcellite"



# Start the actual setup:

apt-get update
apt-get -y install etckeeper aptitude



cat > /etc/apt/sources.list <<EOF
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie main contrib non-free

deb http://security.debian.org/ jessie/updates main contrib non-free
deb-src http://security.debian.org/ jessie/updates main contrib non-free

# jessie-updates, previously known as 'volatile'
deb http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
deb-src http://httpredir.debian.org/debian/ jessie-updates main contrib non-free
EOF



apt-get -y update && apt-get -y upgrade && apt-get -y dist-upgrade
aptitude -y install $ESSENTIALS $DESKTOP_ENV $NETWORKING $AUDIO $BROWSERS $MULTIMEDIA $FILE_MGMT $EDITORS $COMPRESSION $EMAIL $VC $MISC
update-alternatives --set x-terminal-emulator $(which stterm)



cat > /usr/local/bin/shot-lock <<EOF
#!/bin/sh
#
# Lock the screen while showing an unreadable version of your current screen
# Author: rcefala
# Required packages: scrot, imagemagick (convert)

SCREEN1=`tempfile --prefix shot- --suffix .png`
SCREEN2=`tempfile --prefix shot- --suffix .png`

scrot $SCREEN1
convert $SCREEN1 -scale 20% -scale 500% $SCREEN2
rm -f $SCREEN1
i3lock -i $SCREEN2
rm -f $SCREEN2
EOF

chmod +x /usr/local/bin/shot-lock



cat > /usr/local/bin/i3exit <<EOF
#!/bin/sh
lock() {
    /usr/local/bin/shot-lock
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
EOF

chmod +x /usr/local/bin/i3exit
