#!/bin/bash
#Description: Helper script to toggle different versions of cinnamon.css
THEMENAME=Cinnamox-Aubergine;
DIRECTORY="/home/$USER/.themes/$THEMENAME/cinnamon/";
cd "$DIRECTORY" || exit;
if [ ! -f "$PWD/cinnamon.css" ]; then
    echo "Something is wrong. Cannot find $PWD/cinnamon.css"
    echo "";
    read -rp "Press enter to exit the script.";
    exit 1;
fi
if [ ! -f "cinnamon_new.css" ]; then
    cp cinnamon.css cinnamon_new.css && cp -f cinnamon_old.css cinnamon.css && echo "Enabled Cinnamon old style. Reloading $THEMENAME.";
    gsettings reset org.cinnamon.theme name;
    gsettings set org.cinnamon.theme name "$THEMENAME";
else
    cp -f cinnamon_new.css cinnamon.css && rm cinnamon_new.css && echo "Enabled Cinnamon new style. Reloading $THEMENAME.";
    gsettings reset org.cinnamon.theme name;
    gsettings set org.cinnamon.theme name "$THEMENAME";
fi
if [ -t 1 ]; then
    echo "";
    read -rp "Press enter to exit the script.";
fi
exit;
