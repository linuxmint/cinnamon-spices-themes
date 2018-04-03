#!/bin/bash
#Description: Helper file to move Cinnamox-Kashmir-Blue.conf to /$HOME/.config/qt5ct/colors folder
THEMENAME=Cinnamox-Kashmir-Blue;
DIRECTORY="/home/$USER/.themes/$THEMENAME/qt5ct/";
QTDIR="$HOME/.config/qt5ct/colors";
cd "$DIRECTORY";
if [ ! -f "$PWD/$THEMENAME.conf" ]; then
	echo "Something is wrong. Cannot find $PWD/$THEMENAME.conf"
    echo "";
    read -p "Press enter to exit the script.";
    cd;
    exit 1;
fi
if [ ! -d "$QTDIR" ]; then
    mkdir "$QTDIR";
fi
echo "Copying $PWD/$THEMENAME.conf to $QTDIR/$THEMENAME.conf"
cp "$PWD/$THEMENAME.conf" "$QTDIR/$THEMENAME.conf";
echo "";
read -p "Press enter to exit the script.";
cd;
exit;
