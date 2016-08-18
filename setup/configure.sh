#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

os=$(uname)
sudo=''
install=''

if [ "$os" = 'Darwin' ]; then
    install='brew install'
elif [ "$os" = 'Linux' ]; then
    if [ $(lsb_release -is) = "Debian" ]; then
        install='apt-get install -y'
    else
        install='sudo apt-get install -y'
        sudo='sudo'
    fi
fi

# http://howtoubuntu.org/things-to-do-after-installing-ubuntu-14-04-trusty-tahr
sudo add-apt-repository -y ppa:videolan/stable-daily
sudo add-apt-repository -y ppa:gnome3-team/gnome3
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

echo 'deb http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
echo 'deb-src http://download.videolan.org/pub/debian/stable/ /' | sudo tee -a /etc/apt/sources.list.d/libdvdcss.list &&
wget -O - http://download.videolan.org/pub/debian/videolan-apt.asc|sudo apt-key add -

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# May be i am a developer but i still need those
install synaptic vlc y-ppa-manager bleachbit \
    flashplugin-installer unace \
    unrar zip unzip p7zip-full p7zip-rar sharutils rar \
    uudeview mpack arj cabextract file-roller libxine1-ffmpeg \
    mencoder flac faac faad sox ffmpeg2theora libmpeg2-4 uudeview \
    libmpeg3-1 mpeg3-utils mpegdemux liba52-dev mpeg2dec vorbis-tools \
    id3v2 mpg321 mpg123 libflac++6 totem-mozilla icedax lame libmad0 \
    libjpeg-progs libdvdcss2 libdvdread4 libdvdnav4 libswscale-extra-2 \
    ubuntu-restricted-extras ubuntu-wallpapers*

install software-properties-common \
    python-software-properties build-essential curl \
    tree automake rlwrap gnome-tweak-tool httpie \
    fish xchm subversion graphviz libappindicator1 \
    ldap-utils apt-transport-https subversion mercurial \
    exuberant-ctags terminator byzanz lzop pv python-dev \
    python-setuptools python-pip

install terminator

if [[ $(google-chrome --version) = '' ]]
then
    if [[ $(getconf LONG_BIT) = "64" ]]
    then
        echo "64bit Detected"
        echo "Installing Google Chrome"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb
        rm -f google-chrome-stable_current_amd64.deb
    else
        echo "32bit Detected"
        echo "Installing Google Chrome"
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_i386.deb
        sudo dpkg -i google-chrome-stable_current_i386.deb
        rm -f google-chrome-stable_current_i386.deb
    fi
fi

echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

install skype
install -f

sudo sh -c 'echo "deb https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client $(lsb_release -c -s) main" > /etc/apt/sources.list.d/atlassian-hipchat4.list'
wget -O - https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public | sudo apt-key add -
sudo apt-get update
install hipchat4

wget http://download.teamviewer.com/download/teamviewer_i386.deb
sudo dpkg -i teamviewer_linux.deb
install -f
rm teamviewer_linux.deb



# Clean up at last
sudo apt-get -f install
sudo apt-get autoremove
sudo apt-get -y autoclean
sudo apt-get -y clean
