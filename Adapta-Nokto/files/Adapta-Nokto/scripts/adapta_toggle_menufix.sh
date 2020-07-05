#!/bin/bash
if [ ! -t 1 ]; then
    exit
fi
THEMENAME="Adapta-Nokto";
DIRECTORY="/home/$USER/.themes/$THEMENAME/cinnamon/";
MENUDEFAULT=".menu-selected-app-box {}"
MENUFIX=".menu-selected-app-box {margin-bottom: 1.09em;}"
cd "$DIRECTORY" || exit;
if ! grep -q "$THEMENAME" cinnamon.css; then
    echo "There is a problem. Cannot find the cinnamon.css file for $THEMENAME in $DIRECTORY.";
    echo "The script should only be used with $THEMENAME.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
if grep -Fq "$MENUDEFAULT" cinnamon.css; then
    sed -i "s|$MENUDEFAULT|$MENUFIX|g" cinnamon.css;
    MESSAGE="Menu app description fix applied."
elif grep -q "$MENUFIX" cinnamon.css; then
    sed -i "s|$MENUFIX|$MENUDEFAULT|g" cinnamon.css;
    MESSAGE="Menu app description fix reverted."
else 
    echo "There is a problem. No string $MENUDEFAULT or $MENUFIX in cinnamon.css";
    echo "The script should only be used with $THEMENAME.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
gsettings reset org.cinnamon.theme name;
sleep 1;
gsettings set org.cinnamon.theme name "$THEMENAME";
if [ -t 1 ]; then
    echo "";
    echo "$MESSAGE";
    echo "";
    read -rp "Press enter to exit the script.";
fi
exit
