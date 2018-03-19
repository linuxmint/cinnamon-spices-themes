#!/bin/bash
#Description: Helper file to write userContent.css to /$HOME/.mozilla/firefox/usersprofile.default folder in order to fix issues with text visibility in input fields with some themes
cd ~/.mozilla/firefox/
if [[ $(grep '\[Profile[^0]\]' profiles.ini) ]]; then 
    PROFPATH=$(grep -E '^\[Profile|^Path|^Default' profiles.ini | grep -1 '^Default=1' | grep '^Path' | cut -c6-);
else
    PROFPATH=$(grep 'Path=' profiles.ini | sed 's/^Path=//');
fi
TARGETPATH="$HOME/.mozilla/firefox/$PROFPATH/chrome";
TARGETFILE="$HOME/.mozilla/firefox/$PROFPATH/chrome/userContent.css";
TARGETSTRING="input, textarea { color: #222; background: #eee; }";
if [ ! -d "$TARGETPATH" ]; then
    mkdir "$TARGETPATH";
    echo "creating folder $TARGETPATH";
    echo "";
fi
if [ ! -f "$TARGETFILE" ]; then
    touch "$TARGETFILE";
    echo "creating file $TARGETFILE";
    echo "";
fi
echo "$TARGETSTRING" >> "$TARGETFILE";
echo "writing  string '$TARGETSTRING' to $TARGETFILE";
echo "";
echo "please restart Firefox for fix to take effect";
echo "";
read -p "Press enter to exit the script.";
cd;
exit;
