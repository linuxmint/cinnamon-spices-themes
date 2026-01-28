## Adapta-Nokto

A dark theme based on Material Design Guidelines.
Cinnamon, Metacity, GTK2, GTK3.22 and GTK4 themes are included.

## Credits

[This fork][this_adapta] is based on:
- [smurphos' fork of Adapta][smurphos_adapta], `spice-build` branch
- [Tista's original Adapta repo][tista_adapta], `master` branch
- [senatoreg's fork of Adapta][senatoreg_adapta], `master` branch
- Misc fixes commited directly to the Adapta CSS in [cinnamon-spices-themes][spices_themes]

[this_adapta]: https://github.com/slak44/adapta-gtk-theme-cinnamon-spices
[smurphos_adapta]: https://github.com/smurphos/adapta-gtk-theme-cinnamon-spices/tree/spice-build
[tista_adapta]: https://github.com/adapta-project/adapta-gtk-theme
[senatoreg_adapta]: https://github.com/senatoreg/adapta-gtk-theme/
[spices_themes]: https://github.com/linuxmint/cinnamon-spices-themes

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

This theme should be compatible with Cinnamon versions:
- `3.2.x`
- `3.4.x`
- `3.6.x`
- `3.8.x`
- `4.0.x`
- `4.2.x`
- `4.4.x`
- `4.6.x`
- `4.8.x`
- `5.0.x`
- `5.2.x`
- `6.0.x`
- `6.2.x`
- `6.4.x`
- `6.6.x`

The GTK3 themes require GTK `3.20.x`+

## Cinnamon Theme Font-Size

For Cinnamon version 4.6.x and later the Cinnamon theme's font characteristics can be set via changing the default font in Font Selection settings module available from the menu.

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


## Version / Modifications

Changes in [this fork][this_adapta]:
* Cinnamon - converted a [manual fix for cornerbar applets][cornerbar] in the spices theme to SCSS
* Cinnamon - converted a [manual fix for the sound applet][sound_padding] in the spices theme to SCSS
* Cinnamon - fix width of some text in sound applet
* Cinnamon - support and fixes for style changes in version 6.4
* Cinnamon - OSD color fixes for 6.4 for regular Adapta
* Gtk - fix generated CSS to avoid :not(.class1.class2)
* Cinnamon - support and fixes for style changes in version 6.6

[cornerbar]: https://github.com/linuxmint/cinnamon-spices-themes/commit/1acded2135d31218834fb0d716d45d1866878629
[sound_padding]: https://github.com/linuxmint/cinnamon-spices-themes/commit/e160215c3a7f5e4cec78b9eaa6d129cdba7e3968

Changes made by senatoreg:
* [Fix render](https://github.com/senatoreg/adapta-gtk-theme/commit/479afd920e69a7c3629f6151e5aaa1cf6cb22891)
* [Fix @extend scss](https://github.com/senatoreg/adapta-gtk-theme/commit/e4b78180ac79e3b6ccbad8171ad59e91028eadd5)
* [sass and gtk4 updates](https://github.com/senatoreg/adapta-gtk-theme/commit/644ab691989d6ca24ee93afa2e2d09dc9c28aabf)
* [Fix deprecated division outside calc()](https://github.com/senatoreg/adapta-gtk-theme/commit/d8c4c6d80cedaf6e3b618200a240d9787853476a)
* [Fix missing deprecated division outside calc() in cinnamon](https://github.com/senatoreg/adapta-gtk-theme/commit/a5ae953dacdf69f4254fba28c65094e9a41513ed)
* [Fix extra gtk-4.0 specific version](https://github.com/senatoreg/adapta-gtk-theme/commit/38a862ff53af1d403b4c421a200967d735cab2e2)
* [Switch sass node package installation to package.json](https://github.com/senatoreg/adapta-gtk-theme/commit/2cc167df182f771e3604b21434a63f54e3f26abf)
* [Update sass version](https://github.com/senatoreg/adapta-gtk-theme/commit/909269ece60b93eea0d288b486bab6cc43794735)

Changes made by smurphos directly to the spices repo (converted back to SCSS):
* Cinnamon - support for Spacer applet theming added in Cinnamon 4.2
* Cinnamon - workspace switcher applet - better distinguish empty workspaces in simple button mode.
* Cinnamon - minor tweak to pop-up menu sizes to better match GTK menus
* Cinnamon - incorporate @fredcw patach to menu category hover color for Cinnamenu
* Cinnamon - add support for calendar with events in Cinnamon 5.2
* Cinnamon - support for new Run Dialog theming in Cinnamon 5.2

Changes retained from smurphos' fork:
* Stylesheets distributed in deobfuscated .css format
* Build includes Cinnamon, GTK 2.0, 3.22 & Metacity-1 themes only
* GTK 3.22 - added support for different colored backgrounds in Nemo dual pane view
* GTK 3.22 - cleaned out irrelevant third party styling related to non-Cinnamon desktop enviroments.
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
