# Cinnamox Theme

Willow-Grove features a soothing leafy green colour scheme with gradients, gentle curves, light borders and text. It includes a Cinnamon Desktop theme along with matching Numix style GTK2, GTK3 and Metacity1 themes for a full Cinnamox experience.


## Credits

Cinnamon theme handcrafted by smurphos.

GTK2, GTK3 and Metacity1 themes made with the assistance of the [Oomox](https://github.com/actionless/oomox) app.

Menu in screenshots is the excellent [CinnVIIStarkMenu](https://cinnamon-spices.linuxmint.com/applets/view/281).


## Installation

Install via Cinnamon's Themes app or download and unzip into your `~/.themes` directory.

Select the Cinnamox theme as your Desktop, Controls and Window Borders in the Cinnamon Themes app.

To allow the GTK2, GTK3 and Metacity1 themes to apply to GUI apps running as root run this command in your terminal after installation to create symlinks to user themes in the system theme directory.

`sudo ln -s ~/.themes/* /usr/share/themes/`


## Compatibility

This theme is compatible with Cinnamon versions `3.2.x`, `3.4.x` & `3.6.x`

The GTK3 themes require GTK `3.18.x` or `3.20+`

The GTK2 theme requires the package `gtk2-engines-murrine` to be installed. This is a default package in Linux Mint.

Built & tested on Linux Mint `18.2` & `18.3` 64bit with Cinnamon `3.4.x`, `3.6.x` & Manjaro `17.0.6` 64Bit with Cinnamon `3.6.x`

## Changelog

2017-08-26 - Release

2017-08-27 - Fixed Screenshot.png to screenshot.png. GTK3 tidy up. Added border to GTK3 tooltip. Added darker background to Nemo inactive pane.

2017-11-19 - Cinnamon Theme - Added theming for .progress bar class for `3.6.x`. Tweaks to Panel, Windows List and Panel Launchers. GTK3 - Recreated GTK3 theme to add gradients to buttons, taskbars etc. GTK2 - included optional HDPI version.

2017-11-26 - GTK2 & GTK3.18 - Rebased with current Oomox release. GTK3.20 - Added support for compatibility with distros other than Linux Mint
