#!/bin/bash
if [ ! -t 1 ]; then
    exit
fi
THEMENAME="Adapta";
DIRECTORY="/home/$USER/.themes/$THEMENAME/cinnamon/";
SYSTEMFONT="stage { color: #263238; font-weight: 400; }";
SYSTEMFONTDESC="System controlled";
SMALLFONT="stage { font-size: 8pt; color: #263238; font-family: Roboto, Sans-Serif; font-weight: 400; }";
SMALLFONTDESC="Small font size (8pt)"
STANDARDFONT="stage { font-size: 10pt; color: #263238; font-family: Roboto, Sans-Serif; font-weight: 400; }";
STANDARDFONTDESC="Standard font size (10pt)"
LARGEFONT="stage { font-size: 12pt; color: #263238; font-family: Roboto, Sans-Serif; font-weight: 400; }";
LARGEFONTDESC="Large font size (12pt)"
VLARGEFONT="stage { font-size: 14pt; color: #263238; font-family: Roboto, Sans-Serif; font-weight: 400; }";
VLARGEFONTDESC="Very large font size (14pt)"
LARGESTFONT="stage { font-size: 16pt; color: #263238; font-family: Roboto, Sans-Serif; font-weight: 400; }";
LARGESTFONTDESC="Largest font size (16pt)"
cd "$DIRECTORY" || exit;
echo "";
echo "*** ADAPTA CINNAMON DESKTOP THEME FONT UTILITY ***";
echo "";
if ! grep -q "$THEMENAME" cinnamon.css; then
    echo "There is a problem. Cannot find the cinnamon.css file for $THEMENAME in $DIRECTORY.";
    echo "The script should only be used with $THEMENAME.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
if grep -Fq "$SYSTEMFONTDESC" cinnamon.css && grep -Fq "$SYSTEMFONT" cinnamon.css; then
    CURRENTDESC="$SYSTEMFONTDESC"; CURRENTFONT="$SYSTEMFONT";
    VARIANT=("$SMALLFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$SMALLFONTDESC" cinnamon.css && grep -q "$SMALLFONT" cinnamon.css; then
    CURRENTDESC="$SMALLFONTDESC"; CURRENTFONT="$SMALLFONT";
    VARIANT=("$SYSTEMFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$STANDARDFONTDESC" cinnamon.css && grep -q "$STANDARDFONT" cinnamon.css; then
    CURRENTDESC="$STANDARDFONTDESC"; CURRENTFONT="$STANDARDFONT";
    VARIANT=("$SYSTEMFONTDESC" "$SMALLFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$LARGEFONTDESC" cinnamon.css && grep -q "$LARGEFONT" cinnamon.css; then
    CURRENTDESC="$LARGEFONTDESC"; CURRENTFONT="$LARGEFONT";
    VARIANT=("$SYSTEMFONTDESC" "$SMALLFONTDESC" "$STANDARDFONTDESC" "$VLARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$VLARGEFONTDESC" cinnamon.css && grep -q "$VLARGEFONT" cinnamon.css; then
    CURRENTDESC="$VLARGEFONTDESC"; CURRENTFONT="$VLARGEFONT";
    VARIANT=("$SYSTEMFONTDESC" "$SMALLFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$LARGESTFONTDESC" "Quit");
elif grep -q "$LARGESTFONTDESC" cinnamon.css && grep -q "$LARGESTFONT" cinnamon.css; then
    CURRENTDESC="$LARGESTFONTDESC"; CURRENTFONT="$LARGESTFONT";
    VARIANT=("$SYSTEMFONTDESC" "$SMALLFONTDESC" "$STANDARDFONTDESC" "$LARGEFONTDESC" "$VLARGEFONTDESC" "Quit");
else
    echo "Cannot confirm the current base font-size of $THEMENAME. Something is wrong.";
    echo "";
    read -rp "Press enter to exit script.";
    exit 1;
fi
echo "Hello $USER, this script allows you to set the base font-size of $THEMENAME. The current base font-size of $THEMENAME is $CURRENTDESC.";
echo "";
echo "Users of Cinnamon 4.6.x and later can leave the font-size as system controlled and amend font characteristics via the Font Selections settings module accessible from the Cinnamon menu.";
echo "";
echo "All font-sizes in the Cinnamon desktop theme (panel, menu, calendar etc) will resize in proprtion to the base font-size.";
echo "";
echo "Select an alternative font-size by entering 1, 2, 3, 4, or 5 and then press enter, or select 6 and press enter to quit.";
echo "";
echo "If you don't like the results simply run this script again to revert or try another variant.";
echo "";
select CHOICE in "${VARIANT[@]}";
do
    case $CHOICE in
    "$SYSTEMFONTDESC")
        NEWDESC="$SYSTEMFONTDESC"; NEWFONT="$SYSTEMFONT";;
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
        cd || exit; exit;;
    *) echo ""; echo "Invalid option. Try another one."; echo ""; continue;;
    esac
    break
done
sed -i "s|$CURRENTDESC|$NEWDESC|g" cinnamon.css;
sed -i "s|$CURRENTFONT|$NEWFONT|g" cinnamon.css;
echo "";
echo "Theme updated.";
echo "";
echo "Activating $THEMENAME - $CHOICE.";
gsettings reset org.cinnamon.theme name;
sleep 1;
gsettings set org.cinnamon.theme name "$THEMENAME";
echo "";
read -rp "Press enter to exit the script.";
exit
