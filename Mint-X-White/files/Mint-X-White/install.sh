# !/bin/bash

############################
##   Cinnamon 2.0 theme   ##
##   ------------------   ##
##      MINT-X-WHITE      ##
############################

## Based on Mint-X, Linux-Mint, Void
## Created by MrVaykadji, 2014-01-02 for Mint 16 Petra
## Free to use, modify, redistribute

## Mint-X-White installation script :

## Open a terminal emulator (ctrl-alt-T) in the directory of this script
# sudo bash install.sh

clear
echo "############################"
echo "##   Cinnamon 2.0 theme   ##"
echo "##   ------------------   ##"
echo "##      MINT-X-WHITE      ##"
echo "############################"

echo "<<< Installing... >>>"
echo ""
echo ""

# copy the theme in /usr/share/themes
echo "- Copying files in /usr/share/theme"
sudo cp -r ../Mint-X-White /usr/share/themes
echo ""

# authorize uninstallation
echo "- Creating uninstallation script"
mkdir -p $HOME/.cinnamon/scripts
cp README/MISC/uninstall-mint-x-white.sh ~/.cinnamon/scripts
sudo chmod +x ~/.cinnamon/scripts/uninstall-mint-x-white.sh
sudo chmod 777 ~/.cinnamon/scripts
echo ""

# apply theme
echo "- Applying theme : Cinnamon - GTK - Metacity"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-X-White"
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-X-White"
gsettings set org.cinnamon.theme name "Mint-X-White"
echo ""

# remove theme from current directory
echo "- Removing useless files"
sudo rm -r ../Mint-X-White
echo ""

echo "..."
echo "<<< Installed ! >>>"
echo ""
echo "To uninstall this theme, go to ~/.cinnamon/scripts and run the uninstaller :"
echo "sudo bash uninstall-mint-x-white.sh"
echo ""
echo "########################"
echo "# Press a key to close #"
echo "########################"
read -n 1 ch
notify-send ''Mint-X-White 'Theme installed ! \nSee ~/.cinnamon/scripts to uninstall.'''
