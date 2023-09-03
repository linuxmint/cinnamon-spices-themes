## CBlue

### A semi-transparent Cinnamon theme, with wallpaper + Firefox extra, Conky and Plank's theme. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `231` of the file `~/.themes/CBlue/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.

**Don't hesitate to bring up inconsistencies in the theme or the extras** [here](https://github.com/Bundy01/cinnamon-spices-themes/issues).


## Wallpaper

It is located in the directory `~/.themes/CBlue/cinnamon/Wallpaper.png`.


## Firefox extra

#### This is a css file that changes the color of the address bar according to the security of a site:
Just copy the file `~/.themes/CBlue/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.

#### From Firefox 69 and after:
You must type `about:config` in the address bar and then modify the value `toolkit.legacyUserProfileCustomizations.stylesheets` by double-clicking on it to switch it to `TRUE`.

![example](https://raw.githubusercontent.com/Bundy01/cinnamon-spices-themes/76ecd5df3cd8936caafacd0f63793baf5d0f1e41/CBlue/extra.png)

#### From Firefox 77 and after:
You need to reinstall the `userChrome.css` file in the Firefox profile.

**Without this modifications, the extra doesn't work.**


## Conky

* Install the `conky` or `conky-all` package, depending on the GNU/Linux distribution. `curl` must already be present, if it isn't, you should install it as well.

* Download the Brizel font [here](https://dl.dafont.com/dl/?f=brizel), then unzip into `~/.local/share/fonts`. The `fc-cache -f -v` command may be needed to update the fonts.

* Copy the file located in `~/.themes/CBlue/cinnamon/TimeFull` and paste it into `~/.conky` (these are hidden folders: Ctrl+h to show them). You must also allow the file to run with the command `chmod 750 ~/.conky/TimeFull`. More informations can be found at the beginning of the file.

### Prevent your conky from flickering
* Increase the update interval in the `TimeFull` file.

If this is not enough:
* Check that the `dbe` module is loaded with the `grep LoadModule /var/log/Xorg.0.log` command
If the module is not present,
* Create the file `/etc/X11/xorg.conf.d/01-conky.conf` and add

```
 Section "Module
 Load "dbe
 EndSection
```
* If you have the `/etc/X11/xorg.conf` file, don't create the previous file but look for the `Section "Module"` line, then add after that line `Load "dbe"`. 
* Then restart X (control+alt+backspace).


## Plank's theme

* Copy the file `~/.theme/CBlue/cinnamon/dock.theme` to `~/.local/share/plank/themes/CBlue/`.
* I recommend the following settings:

![](https://raw.githubusercontent.com/Bundy01/cinnamon-spices-themes/2d6bc2b84207a66c5caae4223af4873f743f5d3e/CBlue/settings-CBlue.png)


## License

This theme is distributed under the terms of the [GPLv3.0 license](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CBlue/LICENCE).
