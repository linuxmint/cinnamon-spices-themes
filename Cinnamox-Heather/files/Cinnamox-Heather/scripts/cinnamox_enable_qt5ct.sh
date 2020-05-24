#!/bin/bash
#Description: Helper file to move Cinnamox-Heather.conf to /$HOME/.config/qt5ct/colors folder
THEMENAME=Cinnamox-Heather;
DIRECTORY="/home/$USER/.themes/$THEMENAME/qt5ct/";
QTDIR="$HOME/.config/qt5ct/colors";
cd "$DIRECTORY" || exit;
if [ ! -f "$PWD/$THEMENAME.conf" ]; then
    if [ -t 1 ]; then
        echo "Something is wrong. Cannot find $PWD/$THEMENAME.conf"
        echo "";
        read -rp "Press enter to exit the script.";
    fi
    exit 1;
fi
if [ ! -d "$QTDIR" ]; then
    mkdir "$QTDIR";
fi
echo "Copying $PWD/$THEMENAME.conf to $QTDIR/$THEMENAME.conf"
cp "$PWD/$THEMENAME.conf" "$QTDIR/$THEMENAME.conf";
if [ -t 1 ]; then
    echo "";
    read -rp "Press enter to exit the script.";
fi
exit;
