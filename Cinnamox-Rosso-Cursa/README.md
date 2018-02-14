# Cinnamox Theme

Rosso-Cursa features a fiery red colour scheme with light text. Cinnamon, Metacity, GTK2, GTK3.18 and GTK3.22 themes included.


## Credits

Cinnamon theme handcrafted by smurphos.

GTK2, GTK3 and Metacity1 themes made with the assistance of the [Oomox](https://github.com/actionless/oomox) app.

Menu in screenshots is the excellent [CinnVIIStarkMenu](https://cinnamon-spices.linuxmint.com/applets/view/281).

Icons in screenshots are from [Vibrancy Colours](http://www.ravefinity.com/p/vibrancy-colors-gtk-icon-theme.html).

## Installation

Install via Cinnamon's Themes app or download and unzip into your `~/.themes` directory.

Select the Cinnamox theme as your Desktop, Controls and Window Borders in the Cinnamon Themes app.

To allow the GTK2, GTK3 and Metacity1 themes to apply to GUI apps running as root run this command in your terminal after installation to create symlinks to user themes in the system theme directory.

`sudo ln -s ~/.themes/* /usr/share/themes/`


## Tweaking

The theme includes an interactive bash script that allows end users to adjust the transparency of the Cinnamon Theme. The default is no transparency.

To access the tool open a terminal window (Ctrl-Alt-T) and use the following command to make the script executable and launch it. 

`chmod +x ~/.themes/Cinnamox-Rosso-Cursa/cinnamon/cinnamox_transparency && ~/.themes/Cinnamox-Rosso-Cursa/cinnamon/cinnamox_transparency`

If you are not happy with the end result simply run `~/.themes/Cinnamox-Rosso-Cursa/cinnamon/cinnamox_transparency` again to chose another option including the default.


## Compatibility

This theme is compatible with Cinnamon versions `3.2.x`, `3.4.x` & `3.6.x`

The GTK3 themes require GTK `3.18.x` or `3.22.x`

The GTK2 theme requires the package `gtk2-engines-murrine` to be installed. This is a default package in Linux Mint.

Built & tested on Linux Mint `18.2` & `18.3` 64bit with Cinnamon `3.4.x`, `3.6.x` & Manjaro `17.0.6` 64Bit with Cinnamon `3.6.x`


## Changelog

2018-02-13 - Release

