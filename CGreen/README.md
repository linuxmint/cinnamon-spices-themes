## CGreen

### A semi-transparent Cinnamon theme, with Firefox extra and Conky. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `275` of the file `~/.themes/CGreen/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.

**Don't hesitate to bring up inconsistencies in the theme or the extras** [here](https://github.com/Bundy01/cinnamon-spices-themes/issues).


## Firefox extra

#### This is a css file that changes the color of the address bar according to the security of a site:
Just copy the file `~/.themes/CGreen/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.

#### From Firefox 69 and after:
You must type `about:config` in the address bar and then modify the value `toolkit.legacyUserProfileCustomizations.stylesheets` by double-clicking on it to switch it to `TRUE`.

![example](https://i.ibb.co/WtC5R3G/extra.png)

#### From Firefox 77 and after:
You need to reinstall the `userChrome.css` file in the Firefox profile. To make sure you get the latest version of the theme, follow this [link](https://cinnamon-spices.linuxmint.com/files/themes/CGreen.zip?) or install the 'Spices Update' applet.

**Without this modifications, the extra doesn't work.**


## Conky

* Install the `conky` or `conky-all` package, depending on the GNU/Linux distribution. `curl` must already be present, if it isn't, you should install it as well.

* Download the Brizel font [here](https://dl.dafont.com/dl/?f=brizel), then unzip into `~/.local/share/fonts`. The `fc-cache -f -v` command may be needed to update the fonts.

* Copy the file located in `~/.themes/CGreen/cinnamon/TimeFull` and paste it into `~/.conky` (these are hidden folders: Ctrl+h to show them). You must also allow the file to run with the command `chmod 750 ~/.conky/TimeFull`. More informations can be found at the beginning of the file.

### Prevent your conky from flickering
- Increase the update interval in the `TimeFull` file.

If this is not enough:
-Check that the `dbe` module is loaded with the `grep LoadModule /var/log/Xorg.0.log` command
If the module is not present,
-Create the file `/etc/X11/xorg.conf.d/01-conky.conf` and add

```
 Section "Module
 Load "dbe
 EndSection
```
-If you have the `/etc/X11/xorg.conf` file, don't create the previous file but look for the `Section "Module"` line, then add after that line `Load "dbe"`. 
-Then restart X (control+alt+backspace).


## License

This theme is distributed under the terms of the [GPLv3.0 license](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CGreen/LICENCE).
