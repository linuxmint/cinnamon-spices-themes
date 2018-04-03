#!/bin/bash
#Description: Helper script to toggle GTK2 HIDPI Support
THEMENAME=Cinnamox-Zanah;
DIRECTORY="/home/$USER/.themes/$THEMENAME/gtk-2.0/";
cd "$DIRECTORY";
if [ ! -f "$PWD/gtkrc" ]; then
	echo "Something is wrong. Cannot find $PWD/gtkrc"
    echo "";
    read -p "Press enter to exit the script.";
    cd;
    exit 1;
fi
if [ ! -f "gtkrc.nohidpi" ]; then
    cp gtkrc gtkrc.nohidpi && cp -f gtkrc.hidpi gtkrc && echo "Enabled HIDPI in GTK2. Reloading $THEMENAME.";
    gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y";
	gsettings set org.cinnamon.desktop.interface gtk-theme "$THEMENAME";
else
	cp -f gtkrc.nohidpi gtkrc && rm gtkrc.nohidpi && echo "Disabled HIDPI in GTK2. Reloading $THEMENAME.";
	gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y";
	gsettings set org.cinnamon.desktop.interface gtk-theme "$THEMENAME";
fi
    echo "";
    read -p "Press enter to exit the script.";
    cd;
    exit;
