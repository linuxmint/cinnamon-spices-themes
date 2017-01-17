# !/bin/bash

############################
##   Cinnamon 2.0 theme   ##
##   ------------------   ##
##      MINT-X-WHITE      ##
############################

## Based on Mint-X, Linux-Mint, Void
## Created by MrVaykadji, 2014-01-02 for Mint 16 Petra
## Free to use, modify, redistribute

## Mint-X-White uninstallation script:

## Double-clic this script 
## OR
## Open a terminal emulator (ctrl-alt-T) in the directory of this script (~/.cinnamon/scripts by default)
# sudo bash uninstall-mint-x-white.sh

echo "############################"
echo "##   Cinnamon 2.0 theme   ##"
echo "##   ------------------   ##"
echo "##      MINT-X-WHITE      ##"
echo "############################"

echo "<<< Uninstalling... >>>"
echo ""
echo ""

# apply base-theme
echo "- Applying Mint-X default theme"
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-X"
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-X"
gsettings set org.cinnamon.theme name "Mint-X"
echo ""

# remove files from /usr/share/theme
echo "- Removing files in /usr/share/theme"
sudo rm -r /usr/share/themes/Mint-X-White
echo ""

# remove uninstallation script
echo "- Removing uninstallation script"
sudo rm ~/.cinnamon/scripts/uninstall-mint-x-white.sh
echo ""

echo "..."
echo "<<< Uninstalled ! >>>"
echo ""
echo ""
echo "########################"
echo "# Press a key to close #"
echo "########################"
read -n 1 ch
notify-send ''Mint-X-White 'Theme uninstalled ! \nMint-X applied instead.'''
