## CBlue

**A semi-transparent Cinnamon theme for Arc-Dark/Arc-Dark-Solid and the Numix-Circle icon theme, with wallpaper + Firefox extra. Inspired by the CBlack theme (author: cloweling).**

If you want a panel that is not transparent, modify the line `304` of the file `~/.themes/CBlue/cinnamon/cinnamon.css`.
For example: background-color: rgba(20, 20, 20, 20, 20, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.


## Wallpaper

It is located in the directory `~/.themes/CBlue/cinnamon/`.


## Firefox extra

**This is a css file that changes the color of the address bar according to the security of a site.**

Just copy the file `~/.themes/CBlue/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.


## Versions

* 1.3: slight modification of the panel and transparency.
* 1.2: some corrections and improvements + Firefox extra.
* 1.1: fixed a bug: list of grouped window applets for the left/right panels.
* 1.0: first version (Cinnamon 4).


## License

This theme is distributed under the terms of the [GPLv3.0 license.](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CBlue/LICENCE)