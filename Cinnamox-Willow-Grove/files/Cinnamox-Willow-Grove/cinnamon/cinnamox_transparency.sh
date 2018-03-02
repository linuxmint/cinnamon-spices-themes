#!/bin/bash
THEMENAME="Cinnamox-Willow-Grove";
DIRECTORY="/home/$USER/.themes/$THEMENAME/cinnamon/";
LIGHTBG="#6f7f5f";
LOWTRANSLIGHTBG="rgba(111, 127, 95, 0.8)";
MODTRANSLIGHTBG="rgba(111, 127, 95, 0.65)";
HIGHTRANSLIGHTBG="rgba(111, 127, 95, 0.5)";
DARKBG="#444c3d";
LOWTRANSDARKBG="rgba(68, 76, 61, 0.9)";
MODTRANSDARKBG="rgba(68, 76, 61, 0.75)";
HIGHTRANSDARKBG="rgba(68, 76, 61, 0.6)";
cd "$DIRECTORY";
echo "";
echo "*** CINNAMOX TRANSPARENCY UTILITY ***";
echo "";
if ! grep -q "$THEMENAME" cinnamon.css; then
	echo "There is a problem. Cannot find the cinnamon.css file for $THEMENAME in $DIRECTORY.";
	echo "The script can only be used with $THEMENAME.";
	echo "";
	read -p "Press enter to exit script.";
	exit 1;
fi
if grep -q "Transparency: None" cinnamon.css && grep -q "$LIGHTBG" cinnamon.css; then
	CURRENT="Transparency: None"; LIGHTBGC=$LIGHTBG; DARKBGC=$DARKBG;
	VARIANT=("Transparency: Low" "Transparency: Medium" "Transparency: High" "Quit");
	cp cinnamon.css cinnamon_original.css;
elif grep -q "Transparency: Low" cinnamon.css && grep -q "$LOWTRANSLIGHTBG" cinnamon.css; then
	CURRENT="Transparency: Low"; LIGHTBGC=$LOWTRANSLIGHTBG; DARKBGC=$LOWTRANSDARKBG; 
	VARIANT=("Transparency: None" "Transparency: Medium" "Transparency: High" "Quit");
elif grep -q "Transparency: Medium" cinnamon.css && grep -q "$MODTRANSLIGHTBG" cinnamon.css; then
	CURRENT="Transparency: Medium"; LIGHTBGC=$MODTRANSLIGHTBG; DARKBGC=$MODTRANSDARKBG; 
	VARIANT=("Transparency: None" "Transparency: Low" "Transparency: High" "Quit");
elif grep -q "Transparency: High" cinnamon.css && grep -q "$HIGHTRANSLIGHTBG" cinnamon.css; then
	CURRENT="Transparency: High";LIGHTBGC=$HIGHTRANSLIGHTBG; DARKBGC=$HIGHTRANSDARKBG;
	VARIANT=("Transparency: None" "Transparency: Low" "Transparency: Medium" "Quit");
else
	echo "Cannot confirm the current transparency of Cinnamox-Willow-Grove. Something is wrong.";
	echo "";
	read -p "Press enter to exit script.";
	exit 1;
fi
echo "Hello $USER, this script allows you to set the transparency of $THEMENAME. The current transparency of $THEMENAME is $CURRENT.";
echo "";
echo "Select a alternative transparency level by entering 1, 2, or 3 and then press enter, or select 4 and press enter to quit.";
echo "";
echo "If you don't like the results simply run this script again to revert or try another variant.";
echo "";
select CHOICE in "${VARIANT[@]}";
do
    case $CHOICE in 
    "Transparency: None")
		LIGHTBGN=$LIGHTBG; DARKBGN=$DARKBG;;
    "Transparency: Low")
		LIGHTBGN=$LOWTRANSLIGHTBG; DARKBGN=$LOWTRANSDARKBG;;
    "Transparency: Medium")
		LIGHTBGN=$MODTRANSLIGHTBG; DARKBGN=$MODTRANSDARKBG;;
    "Transparency: High")
		LIGHTBGN=$HIGHTRANSLIGHTBG; DARKBGN=$HIGHTRANSDARKBG;;
	"Quit")
		cd; exit;;
    *) echo ""; echo "Invalid option. Try another one."; echo ""; continue;;
    esac
    break
done
cp cinnamon.css cinnamon_last.css;
sed -i "s|$LIGHTBGC|$LIGHTBGN|g" cinnamon.css;
sed -i "s|$DARKBGC|$DARKBGN|g" cinnamon.css;
sed -i "s|$CURRENT|$CHOICE|g" cinnamon.css;
echo "";
echo "Theme updated.";
echo "";
if which gsettings > /dev/null; then
	echo "Activating $THEMENAME - $CHOICE.";
	gsettings set org.cinnamon.theme name 'cinnamon';
	gsettings set org.cinnamon.theme name "$THEMENAME";
else
	echo"If $THEMENAME is already active then press Ctrl-Alt-Esc to reload cinnamon and the theme. If $THEMENAME is not active go to the Themes App and set $THEMENAME as your desktop theme.";
	echo"But first exit the script.";
fi
echo "";
read -p "Press enter to exit the script.";
cd;
exit
