	######################
	 ####################
	  ## INFORMATIONS ##
	 ####################
	######################
		* Created by MrVaykadji
		* Based on Mint-X, Linux Mint, Void
		* Version : 0.2 (2 jan 2014)
		* http://cinnamon-spices.linuxmint.com/themes/view/274


Mint-X-White is a clean and smooth theme, with dominance of White and Green. 
It is designed to fully theme Cinnamon 2.0 (Linux Mint 16 Petra)

Mint-X-White can theme :
    - Cinnamon 2.0 Panel, Menu, Applets, Desklets (Navbar)
    - GTK theme (Main windows)
    - Metacity (Window manager)

      
     / \
    /   \	Please leave feedback if you like or
   /  |  \	  dislike this theme, so I'll know
  /   .   \	what I will improve on the next release.
 /_________\

================================================================================


	######################
	 ####################
	  ## INSTALLATION ##
	 ####################
	######################

NOTE : Installation is recommended on /usr/share/themes for the "root windows" support when using the GTK theme. If you don't use the GTK theme, it can be installed in $HOME/.themes (default with Cinnamon theme manager)

==============================
A. Automated installation :
==============================

1) Launch install.sh (double-clic or commandline "sudo bash install.sh")

==============================
B. Manual installation :
==============================
1) Download the theme archive .zip :

    http://cinnamon-spices.linuxmint.com/themes/view/274


2) Extract the .zip archive, then delete the archive


3) Move the directory "Mint-X-White" to /usr/share/themes :

    sudo mv -r Mint-X-White /usr/share/themes


4) Apply Mint-X-White theme :

    gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-X-White"
    gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-X-White"
    gsettings set org.cinnamon.theme name "Mint-X-White"


#########################################

Changelogs :
--------------
v0.2 : 2014-01-02
- Color match improvement
- Installation script
- Panel lightened
- CSS cleaned and commented
- Added README.txt
- workspace switcher changed
- alt-tab changed

v0.1 : 2014-01-01
- First release

