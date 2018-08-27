#!/bin/bash
#Description: Helper file to write user.js to /$HOME/.mozilla/firefox/usersprofile.default folder in order to fix issues with text visibility in input fields with some themes
if find "$HOME"/.mozilla/firefox/ -maxdepth 1 -type d -name '*.default' | head -1; then 
    TARGETPATH=$(find "$HOME"/.mozilla/firefox/ -maxdepth 1 -type d -name '*.default' | head -1)
    TARGETFILE="$TARGETPATH/user.js"
	TARGETSTRING="user_pref(\"widget.content.gtk-theme-override\", \"Adwaita\");"
	if [ ! -f "$TARGETFILE" ]; then
		touch "$TARGETFILE"
		echo "creating file $TARGETFILE"
		echo ""
	fi
	if ! grep -q "widget.content.gtk-theme-override" "$TARGETFILE"; then
		echo "$TARGETSTRING" >> "$TARGETFILE"
		echo "writing  string '$TARGETSTRING' to $TARGETFILE"
		echo ""
		echo "please restart Firefox for fix to take effect"
	else
		echo "$TARGETFILE already contains a widget.content.gtk-theme-override"
	fi
else
    echo "could not locate your .default firefox profile"
fi
echo ""
read -rp "Press enter to exit the script."
exit
