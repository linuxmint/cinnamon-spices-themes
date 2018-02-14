# Cinnamox Theme

Gold Spice features a warm orange and brown colour scheme with light text. Cinnamon, Metacity, GTK2, GTK3.18 and GTK3.22 themes included.


## Credits

Cinnamon theme handcrafted by smurphos.

GTK2, GTK3 and Metacity1 themes made with the assistance of the [Oomox](https://github.com/actionless/oomox) app.

Menu in screenshots is the excellent [CinnVIIStarkMenu](https://cinnamon-spices.linuxmint.com/applets/view/281).

Icons in screenshots are from [Vibrancy Colours](http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html).

## Installation

Install via Cinnamon's Themes app or download and unzip into your `~/.themes` directory.

Select the Cinnamox theme as your Desktop, Controls and Window Borders in the Cinnamon Themes app.

To allow the GTK2, GTK3 and Metacity1 themes to apply to GUI apps running as root run this command in your terminal (Ctrl-Alt-T) after installation to create symlinks to user themes in the system theme directory.

`sudo ln -s ~/.themes/* /usr/share/themes/`


## Tweaking

The theme includes an interactive bash script that allows end users to adjust the transparency of the Cinnamon Theme. The default is no transparency.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Gold-Spice/cinnamon/cinnamox_transparency && ~/.themes/Cinnamox-Gold-Spice/cinnamon/cinnamox_transparency`

If you are not happy with the end result simply run `~/.themes/Cinnamox-Gold-Spice/cinnamon/cinnamox_transparency` again to chose another option including the default.


## Compatibility

This theme is compatible with Cinnamon versions `3.2.x`, `3.4.x` & `3.6.x`

The GTK3 themes require GTK `3.18.x` or `3.22.x`

The GTK2 theme requires the package `gtk2-engines-murrine` to be installed. This is a default package in Linux Mint.

Built & tested on Linux Mint `18.2` & `18.3` 64bit with Cinnamon `3.4.x`, `3.6.x` & Manjaro `17.0.6` 64Bit with Cinnamon `3.6.x`


## Changelog

2017-08-26 - 	Release

2017-08-27 - 	Fixed Screenshot.png to screenshot.png. GTK3 tidy up. Added border to GTK3 tooltip. Added darker background to Nemo inactive pane.

2017-11-19 - 	Cinnamon Theme - Added theming for .progress bar class for `3.6.x`. Tweaks to Panel, Windows List and Panel Launchers. GTK3 - Recreated GTK3 theme to add gradients to buttons, taskbars etc. GTK2 - included optional HDPI version.

2017-11-26 - 	GTK2 & GTK3.18 - Rebased with current Oomox release. GTK3.20 - Added support for compatibility with distros other than Linux Mint

2018-02-13 - 	Cinnamon Theme - Moved all font-size declarations to em to support scaling.
				Cinnamon Theme - Highlighted applet icons & labels now use theme highlight colour.
				Cinnamon Theme - Added margin to menus to seperate them slightly from the panel.
				Cinnamon Theme - Better visibility of panel sections in panel edit mode.
				Cinnamon Theme - Rethemed Scale view, Expo, Alt-Tab, On-Screen Keyboard, Looking Glass dialogue and various applets.
				Cinnamon Theme - Tweaked highlighting colours and selected text colours to support lighter variants of Cinnamox.
				Cinnamon Theme - Included bash utility to allow end user to adjust transparancy of Cinnamon theme.
				Metacity - Title bar background colour varies with window focus.
				GTK - Rebased on modified Oomox-GTK-Theme version 1.60 with GTK2, GTK3.18.x and GTK3.22.x themes provided.
				GTK - Tweaks to button highlighting colours for consistency with Cinnamon Theme changes.
				GTK - Header bar background colour on Gnome/CSD apps varies with window focus.
				GTK - In GTK 3.22 Nemo now supports different coloured panes in dual pane mode.
				GTK - Nemo - Tweaked amount of colour change in dual panel mode and fixed text highlighting bug in inactive panel.
				GTK - Fixed warning, information and error colours from Oomox's bizarre defaults. 
				General - New Thumbnails & Screenshots, removed some superfluous files from the GTK build.
