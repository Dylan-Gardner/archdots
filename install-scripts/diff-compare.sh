#!/bin/bash
# by ian k. bania (feb '20)
# lets me easily compare my local differences in dotfiles to the ones in the repo, so i dont overwrite any edits i've made locally

# move to the directory the script is in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

echo "##### i3/config ######"
diff ../i3/config ~/.config/i3/config
echo "##### polybar/config ######"
diff ../polybar/config ~/.config/polybar/config
echo "##### polybar/launch.sh ######"
diff ../polybar/launch.sh ~/.config/polybar/launch.sh
echo "##### rofi/config ######"
diff ../rofi/config.rasi ~/.config/rofi/config.rasi
echo "##### compton/compton.conf ######"
diff ../compton/compton.conf ~/.config/compton/compton.conf
echo "##### spotify-tui/config.yml ######"
diff ../spotify-tui/config.yml ~/.config/spotify-tui/config.yml
echo "##### spotifyd/config ######"
diff ../spotifyd/config ~/.config/spotifyd/config
echo "##### slack-term/config ######"
diff ../slack-term/config ~/.config/slack-term/config
echo "##### ranger/rc.conf ######"
diff ../ranger/rc.conf ~/.config/ranger/rc.conf
echo "##### ranger/rifle.conf ######"
diff ../ranger/rifle.conf ~/.config/ranger/rifle.conf
echo "##### neofetch/config.conf ######"
diff ../neofetch/config.conf ~/.config/neofetch/config.conf
echo "##### nvim/init.vim ######"
diff ../nvim/init.vim ~/.config/nvim/init.vim
echo "##### wal/templates/colors-rofi-dark.rasi #####"
diff ../wal/templates/colors-rofi-dark.rasi ~/.config/wal/templates/colors-rofi-dark.rasi
echo "##### wal/templates/dunstrc #####"
diff ../wal/templates/dunstrc ~/.config/wal/templates/dunstrc
echo "##### wal/templates/zathurarc #####"
diff ../wal/templates/zathurarc ~/.config/wal/templates/zathurarc
echo "##### kitty/kitty.conf #####"
diff ../kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "##### .bashrc ######"
diff ../.bashrc ~/.bashrc
echo "##### .Xresources ######"
diff ../.Xresources ~/.Xresources 
echo "##### chrome/userChrome.css ######"
diff ../chrome/userChrome.css ~/.mozilla/firefox/*.default-release/chrome/userChrome.css
echo "##### chrome/userContent.css ######"
diff ../chrome/userContent.css ~/.mozilla/firefox/*.default-release/chrome/userContent.css
echo "##### spotify-tui/spotify-tui.desktop ######"
diff ../spotify-tui/spotify-tui.desktop ~/.config/spotify-tui/spotify-tui.desktop
echo "##### Android Messages/Settings ######"
diff ../android-messages-desktop/Settings ~/.config/android-messages-desktop/Settings
echo "##### gtk/dark.ini ######"
diff ../gtk/dark.ini ${HOME}/.config/gtk-3.0/dark.ini
diff ../gtk/dark.ini ${HOME}/.config/gtk-4.0/dark.ini
echo "##### gtk/light.ini ######"
diff ../gtk/light.ini ${HOME}/.config/gtk-3.0/light.ini
diff ../gtk/light.ini ${HOME}/.config/gtk-4.0/light.ini
echo "##### gtk/.gtkrc-2.0.dark ######"
diff ../gtk/.gtkrc-2.0.dark ${HOME}/.gtkrc-2.0.dark
echo "##### gtk/.gtkrc-2.0.light ######"
diff ../gtk/.gtkrc-2.0.light ${HOME}/.gtkrc-2.0.light

echo "

"
echo "############### SCRIPTS ################"

cd ../scripts
for f in *.sh; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        diff $f /bin/$NAME 
done

for f in *.py; do
        NAME=${f::-3}
        echo "########## "
        echo $NAME
        diff $f /bin/$NAME 
done
