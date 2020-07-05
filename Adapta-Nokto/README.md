## Adapta-Nokto

A dark theme based on Material Design Guidelines. Cinnamon, Metacity, GTK2, GTK3.18 and GTK3.22+ themes are included.

## Credits

This is a build of [Tista's](https://github.com/tista500) [Adapta theme](https://github.com/adapta-project/adapta-gtk-theme) made for Cinnamon Spices.

## Version / Modifications

[Original Source Code](https://github.com/adapta-project/adapta-gtk-theme)

[Fork for this build](https://github.com/smurphos/adapta-gtk-theme-cinnamon-spices/tree/spice-build)

This build is based on [Adapta version 3.95.0.11](https://github.com/adapta-project/adapta-gtk-theme/releases/tag/3.95.0.11) with the following modifications.

* Retain support for GTK 3.18
* Stylesheets distributed in deobfuscated .css format
* Build includes Cinnamon, GTK 2.0, 3.18, 3.22 & Metacity-1 themes only
* GTK3.18 & 3.22 - added support for different colored backgrounds in Nemo dual pane view
* GTK3.18 & 3.22 - cleaned out irrelevant third party styling related to non-Cinnamon desktop enviroments.
* Scripts - firefox_fix.sh script included to fix issues with firefox and dark themes
* Cinnamon - fixed workspace-switcher applet on vertical panels
* Cinnamon - fixed to menu theming for cinnamenu compatibility
* Cinnamon - cinnamon 4.0 grouped window list applet theming by @jaszhix & @smurphos
* Cinnamon - support for Cinnamon 4.0 windows overview theming
* Cinnamon - fixed keyboard applet on vertical panels
* Cinnamon - fixed off-centre media-key osd
* Cinnamon - added spacing to menu-favorites-box to distinguish scrollbox from system-buttons
* GTK 3.22 - Add a minimum height to headerbars.
* Cinnamon - amend panel label text alignment to support centred labels on multiline calendar applet labels
* Cinnamon - simplified grouped window list thumbnail theming in preparation for Cinnamon 4.2
* Cinnamon - support for users on Cinnamon 4.6 and later to set the base theme font size and family via the Font Selections settings module
* Cinnamon - added adapta_fontsize.sh script to allow users to revert to theme controlled font size and family with a choice of base font-size
* Cinnamon - change all theme font-size declarations to scalable units
* Cinnamon - fix the calendar applet's menu scaling to accomodate different font-sizes
* Cinnamon - fix the sound applet's menu scaling to accomodate different font-sizes
* Cinnamon - increased contrast for grouped window list / window list boxshadow to indicate open unfocused applications
* Cinnamon - increased contrast to indicate active and inactive windows in workspace-switcher applet
* Cinnamon - alt-tab window preview mode - shade backdrop so the previewed window pops
* Cinnamon - virtual keyboard - usability tweaks
* Cinnamon - 4.6.x stock menu - add a height declaration for the app description box, and reduce margins
* Cinnamon - add a helper script to revert above change for users still on 4.4.x or earlier

## License

This theme is distributed under the terms of the [GPLv2.0 license](https://github.com/smurphos/adapta-gtk-theme/blob/master/COPYING)

Assets in svg format are distributed under the terms of the [CC BY-SA 4.0 license](https://github.com/smurphos/adapta-gtk-theme/blob/master/LICENSE_CC_BY_SA4)

Cinnamon thumbnail includes a depiction of icons from Sam Hewitt's [Paper Icons](https://snwh.org/paper) licensed under CC-SA-4.0

Wallpaper in screenshots is from [Adapta Backgrounds](https://github.com/adapta-project/adapta-backgrounds) licensed under [CC BY-SA 4.0 license](https://github.com/adapta-project/adapta-backgrounds/blob/master/LICENSE_CC_BY_SA4)

## Installation

Install via Cinnamon's Themes module in Cinnamon settings or download from [Cinnamon Spices](https://cinnamon-spices.linuxmint.com/themes) and unzip into your `~/.themes` directory.

Select the theme as your Desktop, Controls and Window Borders in the Cinnamon Themes module.

To allow the GTK2, GTK3 and Metacity1 themes to apply to GUI apps running as root run this command in your terminal after installation to create a symlink to the theme in the local system theme directory.

`sudo mkdir -p /usr/local/share/themes; sudo ln -s ~/.themes/Adapta-Nokto /usr/local/share/themes/`

## Compatibility

This theme is compatible with Cinnamon versions `3.2.x`, `3.4.x`, `3.6.x`, `3.8.x`, `4.0.x`, `4.2.x`, `4.4.x` & `4.6.x`

The GTK3 themes require GTK `3.18.x` or `3.20.x`+

## Cinnamon Theme Font-Size

For Cinnamon version 4.6.x and later the Cinnamon theme's font characteristics van be set via changing the default font in Font Selection settings module available from the menu.

For users of older Cinnamon versions the theme includes an interactive bash script that allows end users to adjust the base font-size in the Cinnamon theme. This can be useful for users running Cinnamon on relatively high resolution displays with relatively small screen dimensions where the hard-coded theme default font-sizes are too small.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Adapta-Nokto/scripts/adapta_fontsize.sh && ~/.themes/Adapta-Nokto/scripts/adapta_fontsize.sh`

If you are not happy with the end result simply run `~/.themes/Adapta-Nokto/scripts/adapta_fontsize.sh` again to chose another option including the default

## Cinnamon Stock Menu applet in Cinnamon 4.4.x and older

The app description area at the bottom of the stock cinnamon menu applet may not expand appropriately to fit the content in Cinnamon 4.4.x and older when text scaling factor is set > 1. 

The theme includes an interactive bash script that allows end users toggle an adjustment of the cinnamon.css to mitigate this behaviour.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Adapta-Nokto/scripts/adapta_toggle_menufix.sh && ~/.themes/Adapta-Nokto/scripts/adapta_toggle_menufix.sh`

If you are not happy with the end result simply run `~/.themes/Adapta-Nokto/scripts/adapta_toggle_menufix.sh` again to revert.

## Firefox fix

If you have problems seeing text on input fields in Firefox with any particular theme this problem can be solved by adding a `~/.mozilla/firefox/********.default/user.js` file to your Firefox default profile including the line `user_pref("widget.content.gtk-theme-override", "Adwaita");` and restarting Firefox.

This forces Firefox to use the GTK default Adwaita theme for rendering all website content.

The theme includes a helper script that creates the file with this content in the correct location. To access the tool open a terminal window and use the following command to make the script executable and launch it.

`chmod +x ~/.themes/Adapta-Nokto/scripts/firefox_fix.sh && ~/.themes/Adapta-Nokto/scripts/firefox_fix.sh`


