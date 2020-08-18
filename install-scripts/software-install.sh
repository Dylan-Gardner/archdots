#!/bin/bash
# by ian k. bania

###################
#     PACMAN      #
###################
# update and upgrade
sudo pacman -Syu

# package lists
SYS="inetutils arandr xdotool nfsidmap exfat-utils dosfstools ntfsprogs cups cups-pdf hddtemp rsync rdiff-backup pulseaudio-bluetooth materia-gtk-theme xorg-xrdb neovim cmake clang bc gdisk rust dbus pulseaudio bluez bluez-utils pass redshift git sudo vi kitty rofi dunst openvpn gnupg imagemagick sox mpg123 ffmpeg feh python ttf-fantasque-sans-mono python-pip nvme-cli lm_sensors openssh vim bash-completion wget curl zip unzip libev startup-notification xcb-util-cursor xcb-util-keysyms xcb-util-wm xcb-util-xrm libxkbcommon-x11 yajl xcb-proto cairo pango libxcb xcb-util-image jsoncpp libmpdclient libnl wireless_tools libpulse alsa-lib htop"
# displaycal
# dialog python-setuptools installed on nep??

NONES="digikam inkscape pavucontrol libreoffice-fresh cheese nmap perl-image-exiftool python-pillow ranger zathura zathura-pdf-mupdf firefox gnuplot vlc darktable neofetch steam atom gimp zathura speedtest-cli"

TRI="vulkan-intel tlp tlp-rdw powertop upower"
#xf86-video-intel

NEP="xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon remmina kdenlive libvncserver virtualbox virtualbox-host-modules-arch"

#python3-venv?
#pipx?

#OLDDESKTOP="busybox busybox-initramfs dropbear-initramfs system76-driver-nvidia openssh-server"
#SYS="libxss-dev macchanger libssl-dev speedtest-cli transmission-cli transmission-daemon exfat-utils libxcb-render0-dev libffi-dev python-dev python-cffi"


# pacman install
read -r -p "#### Would you like to install 'essential' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $SYS
fi

read -r -p "#### Would you like to install 'optional' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $NONES
fi

read -r -p "#### Would you like to install 'triton' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $TRI
fi

read -r -p "#### Would you like to install 'neptune' software? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        sudo pacman -S --needed $NEP
fi


###################
#       YAY       #
###################
# clone and install yay
read -r -p "#### Would you like to install yay (an AUR package manager)? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        git clone https://aur.archlinux.org/yay.git
        cd yay
        makepkg -si
        cd .. && sudo rm -r yay
fi

# yay package list #########################################################
YAYSYS="brother-mfc-9560cdw ttf-symbola paper-icon-theme vim-plug gllock-git compton-tryone-git ly steam-fonts"
#python-pipx teamviewer autotiling
YAYNEPTUNE="siril-git google-earth-pro virtualbox-ext-oracle remmina-plugin-rdesktop"
YAYTRITON="system76-power system76-firmware-daemon system76-driver light-git"
YAYNONES="spotify mfetch-git android-messages-desktop spotifyd-bin-full zoom"
##########################################################################
# yay install

# yay crashes if a single install canidate has issues, 
# which is farirly common considering that yay's dependency system is broken 
# and the AUR is the wild wild west, because of this we have to run yay
# individually on each package
read -r -p "#### Would you like to install 'essential' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYSYS)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install 'triton' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYTRITON)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install 'neptune' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYNEPTUNE)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi

read -r -p "#### Would you like to install 'optional' yay packages? [y/N] ####" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        ARR=($YAYNONES)
        for i in "${ARR[@]}"; do
                yay -S --needed $i
        done
fi



####################
#    GIT REPOS     #
####################
# install light utility
#read -r -p "Would you like to install light (a backlight control utility)? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        git clone https://github.com/haikarainen/light.git
#        cd light
#        ./autogen.sh
#        ./configure
#        make
#        sudo make install              
#        cd ..
#        sudo rm -r light
#        echo 'light.git installed'
#fi

# gnuplot pywal 
read -r -p "Would you like to install Gnuplot-Pywal? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
        git clone https://github.com/GideonWolfe/Gnuplot-Pywal.git
        cd Gnuplot-Pywal
        sudo ./install.sh
        cd ..
        sudo rm -r Gnuplot-Pywal
        echo 'Gnuplot-Pywal.git installed'
fi


# now using the AUR
# install spotifyd
#read -r -p "Would you like to install Spotifyd v0.2.24? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        wget https://github.com/Spotifyd/spotifyd/releases/download/v0.2.24/spotifyd-linux-full.tar.gz
#        tar -xf spotifyd-linux-full.tar.gz
#        sudo mv spotifyd /bin/spotifyd
#        rm spotifyd-linux-full.tar.gz
#fi
# install nvim plugin manager
#read -r -p "Would you like to install vim-plug? [y/N]" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.git
#        hubusercontent.com/junegunn/vim-plug/master/plug.vim
#fi


####################
#      PYTHON      #
####################
# install python packages
read -r -p "Would you like to install python packages? [y/N]" response
if [[ "$response" =~ ^([Yy])+$ ]]; then
    sudo pip3 install pywal
    sudo pip install flashfocus
    sudo pip3 install protonvpn-cli
    sudo pip3 install inkscape-figures
    sudo pip3 install spotdl
    sudo pip3 install cl-chess
    sudo pipx install jrnl
    sudo pip install mdv
    #sudo pip install i3-py
    #sudo pip3 install wpgtk
    echo 'python packages installed'
fi

####################
#      RUST        #
####################
# install rust
#read -r -p "Would you like to install rust? [y/N]" response 
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#fi

# install rust packages    
read -r -p "Would you like to install rust packages? [y/N]" response 
if [[ "$response" =~ ^([Yy])+$ ]]; then
        cargo install spotify-tui
        cargo install bottom
        cargo install dijo
        cargo install -f --git https://github.com/cjbassi/ytop ytop
fi


####################
#    i3 COMPILE    #
####################
#read -r -p "#### Would you like to compile and install i3? [y/N] ####" response
#if [[ "$response" =~ ^([Yy])+$ ]]; then
#        ./i3gaps-install
#fi



# all done!
