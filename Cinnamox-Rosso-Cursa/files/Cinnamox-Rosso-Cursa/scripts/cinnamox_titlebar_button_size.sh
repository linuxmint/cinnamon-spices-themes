#!/bin/bash
if [ ! -t 1 ]; then
    exit
fi
THEMENAME="Cinnamox-Rosso-Cursa";
DIRECTORY="/home/$USER/.themes/$THEMENAME/metacity-1/";
SMALL='constant name="D_icons_grow" value="0"';
SMALLDESC="Small"
MEDIUM='constant name="D_icons_grow" value="1"';
MEDIUMDESC="Medium"
LARGE='constant name="D_icons_grow" value="2"';
LARGEDESC="Large"
HUGE='constant name="D_icons_grow" value="3"';
HUGEDESC="Huge"
cd "$DIRECTORY" || exit;
echo "";
echo "*** CINNAMOX METACITY TITLEBAR BUTTON SIZE UTILITY ***";
echo "";
if ! grep -q "$THEMENAME" metacity-theme-3.xml; then
    echo "There is a problem. Cannot find the metacity-theme-3.xml file for $THEMENAME in $DIRECTORY.";
    echo "The script should only be used with $THEMENAME.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
if grep -q "$SMALL" metacity-theme-3.xml; then
    CURRENTDESC="$SMALLDESC"; CURRENT="$SMALL";
    VARIANT=("$MEDIUMDESC" "$LARGEDESC" "$HUGEDESC" "Quit");
elif grep -q "$MEDIUM" metacity-theme-3.xml; then
    CURRENTDESC="$MEDIUMDESC"; CURRENT="$MEDIUM";
    VARIANT=("$SMALLDESC" "$LARGEDESC" "$HUGEDESC" "Quit");
elif grep -q "$LARGE" metacity-theme-3.xml; then
    CURRENTDESC="$LARGEDESC"; CURRENT="$LARGE";
    VARIANT=("$SMALLDESC" "$MEDIUMDESC" "$HUGEDESC" "Quit");
elif grep -q "$HUGE" metacity-theme-3.xml; then
    CURRENTDESC="$HUGEDESC"; CURRENT="$HUGE";
    VARIANT=("$SMALLDESC" "$MEDIUMDESC" "$LARGEDESC" "Quit");
else
    echo "Cannot confirm the current titlebar button size of $THEMENAME. Something is wrong.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
echo "Hello $USER, this script allows you to adjust the titlebar button size for $THEMENAME. The current titlebar button-size of $THEMENAME is $CURRENTDESC.";
echo "";
echo "Please note this tweak only affects windows using a traditional Metacity themed titlebar. It does not affect windows with Client Side Decoration.";
echo "";
echo "Select an alternative button size by entering 1, 2, or 3 and then press enter, or select 4 and press enter to quit.";
echo "";
echo "If you don't like the results simply run this script again to revert or try another variant.";
echo "";
select CHOICE in "${VARIANT[@]}";
do
    case $CHOICE in
    "$SMALLDESC")
        NEWSIZE="$SMALL";;
    "$MEDIUMDESC")
        NEWSIZE="$MEDIUM";;
    "$LARGEDESC")
        NEWSIZE="$LARGE";;
    "$HUGEDESC")
        NEWSIZE="$HUGE";;
    "Quit")
        cd || exit; exit;;
    *) echo ""; echo "Invalid option. Try another one."; echo ""; continue;;
    esac
    break
done
sed -i "s|$CURRENT|$NEWSIZE|g" metacity-theme-3.xml;
echo "";
echo "Theme updated.";
echo "";
echo "Activating $THEMENAME - $CHOICE.";
gsettings reset org.cinnamon.desktop.wm.preferences theme;
sleep 1;
gsettings set org.cinnamon.desktop.wm.preferences theme "$THEMENAME";
echo "If you don't see any change in the current window titlebar go to the Themes App and briefly set a different window border theme and then set $THEMENAME as your windows border theme.";
echo "";
read -rp "Press enter to exit the script.";
exit
