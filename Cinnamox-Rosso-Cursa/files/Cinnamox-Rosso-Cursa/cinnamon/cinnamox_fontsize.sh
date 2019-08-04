#!/bin/bash
if [ ! -t 1 ]; then
    exit
fi
THEMENAME="Cinnamox-Rosso-Cursa";
DIRECTORY="/home/$USER/.themes/$THEMENAME/cinnamon/";
SMALLFONT="font-size: 8pt";
SMALLFONTDESC="Small font size (8pt)"
STANDARDFONT="font-size: 10pt";
STANDARDFONTDESC="Standard font size (10pt)"
LARGEFONT="font-size: 12pt"
LARGEFONTDESC="Large font size (12pt)"
VLARGEFONT="font-size: 14pt"
VLARGEFONTDESC="Very large font size (14pt)"
LARGESTFONT="font-size: 16pt"
LARGESTFONTDESC="Largest font size (16pt)"
cd "$DIRECTORY";
echo "";
echo "*** CINNAMOX CINNAMON DESKTOP THEME FONT UTILITY ***";
echo "";
if ! grep -q "$THEMENAME" cinnamon.css; then
	echo "There is a problem. Cannot find the cinnamon.css file for $THEMENAME in $DIRECTORY.";
	echo "The script should only be used with $THEMENAME.";
	echo "";
	read -p "Press enter to exit script.";
	exit 1;
fi
if grep -q "$SMALLFONTDESC" cinnamon.css && grep -q "$SMALLFONT" cinnamon.css; then
	CURRENTDESC="$SMALLFONTDESC"; CURRENTFONT="$SMALLFONT";
	VARIANT=("$STANDARDFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$STANDARDFONTDESC" cinnamon.css && grep -q "$STANDARDFONT" cinnamon.css; then
	CURRENTDESC="$STANDARDFONTDESC"; CURRENTFONT="$STANDARDFONT";
	VARIANT=("$SMALLFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$LARGEFONTDESC" cinnamon.css && grep -q "$LARGEFONT" cinnamon.css; then
	CURRENTDESC="$LARGEFONTDESC"; CURRENTFONT="$LARGEFONT";
	VARIANT=("$SMALLFONTDESC" "$STANDARDFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$VLARGEFONTDESC" cinnamon.css && grep -q "$VLARGEFONT" cinnamon.css; then
	CURRENTDESC="$VLARGEFONTDESC"; CURRENTFONT="$VLARGEFONT";
	VARIANT=("$SMALLFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$LARGESTFONTDESC" cinnamon.css && grep -q "$LARGESTFONT" cinnamon.css; then
	CURRENTDESC="$LARGESTFONTDESC"; CURRENTFONT="$LARGESTFONT";
	VARIANT=("$SMALLFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "Quit");
else
	echo "Cannot confirm the current base font-size of $THEMENAME. Something is wrong.";
	echo "";
	read -p "Press enter to exit script.";
	exit 1;
fi
echo "Hello $USER, this script allows you to set the base font-size of $THEMENAME. The current base font-size of $THEMENAME is $CURRENTDESC.";
echo "";
echo "All font-sizes in the Cinnamon dekstop theme (panel, menu, calendar etc) will resize in proprtion to the base font-size.";
echo "";
echo "Select a alternative font-size by entering 1, 2, 3, or 4 and then press enter, or select 5 and press enter to quit.";
echo "";
echo "If you don't like the results simply run this script again to revert or try another variant.";
echo "";
select CHOICE in "${VARIANT[@]}";
do
    case $CHOICE in 
    "$SMALLFONTDESC")
		NEWDESC="$SMALLFONTDESC"; NEWFONT="$SMALLFONT";;
    "$STANDARDFONTDESC")
		NEWDESC="$STANDARDFONTDESC"; NEWFONT="$STANDARDFONT";;
    "$LARGEFONTDESC")
		NEWDESC="$LARGEFONTDESC"; NEWFONT="$LARGEFONT";;
    "$VLARGEFONTDESC")
		NEWDESC="$VLARGEFONTDESC"; NEWFONT="$VLARGEFONT";;
    "$LARGESTFONTDESC")
		NEWDESC="$LARGESTFONTDESC"; NEWFONT="$LARGESTFONT";;
	"Quit")
		cd; exit;;
    *) echo ""; echo "Invalid option. Try another one."; echo ""; continue;;
    esac
    break
done
sed -i "s|$CURRENTDESC|$NEWDESC|g" cinnamon.css;
sed -i "s|$CURRENTFONT|$NEWFONT|g" cinnamon.css;
echo "";
echo "Theme updated.";
echo "";
if which gsettings > /dev/null; then
	echo "Activating $THEMENAME - $CHOICE.";
	gsettings reset org.cinnamon.theme name;
	gsettings set org.cinnamon.theme name "$THEMENAME";
else
	echo"If $THEMENAME is already active then press Ctrl-Alt-Esc to reload cinnamon and the theme. If $THEMENAME is not active go to the Themes App and set $THEMENAME as your desktop theme.";
	echo"But first exit the script.";
fi
echo "";
read -p "Press enter to exit the script.";
cd;
exit
