## CBlue

### A semi-transparent Cinnamon theme, with wallpaper, Conky and Plank's theme. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `243` of the file `~/.themes/CBlue/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.

If the theme's font is too small, you can modify Cinnamon's settings:
* `System settings>Accessibility>Display>Large text` or/and
* `System settings>Font selection` or/and
* `System settings>Font settings>Text scaling factor`

**Don't hesitate to bring up inconsistencies in the theme** [here](https://github.com/Bundy01/cinnamon-spices-themes/issues).


## Wallpaper

It is located in the directory `~/.themes/CBlue/cinnamon/Wallpaper.png`.


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
