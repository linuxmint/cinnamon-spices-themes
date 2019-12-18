## CBlue

#### A semi-transparent Cinnamon theme, with wallpaper + Firefox extra. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `300` of the file `~/.themes/CBlue/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.


## Wallpaper

It is located in the directory `~/.themes/CBlue/cinnamon/`.


## Firefox extra

### This is a css file that changes the color of the address bar according to the security of a site:
Just copy the file `~/.themes/CBlue/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.

### From Firefox 69 and after:
You must type `about:config` in the address bar and then modify the value `toolkit.legacyUserProfileCustomizations.stylesheets` by double-clicking on it to switch it to `TRUE`.


![example](https://i.postimg.cc/L8G7tSsw/extra.png)

**Without this modification, the extra doesn't work.**


## Versions

* 1.12: fixed a bug in the panel-launchers applet for vertical panels, magnification of some panel elements.
* 1.11: workspace-graph editing.
* 1.10: slight panel touch-ups.
* 1.9: instruction for the extra from Firefox 69.
* 1.8: color arrows calendar, modification of the workspace applet (visual representation).
* 1.7: modify categories in the menu and menu items, change of the sound player applet buttons.
* 1.6: change of background color.
* 1.5: support for Weather + BAMS applets and photoframe desklet.
* 1.4: hover color, visual lock indicator Num/Shift, desklets decorations supported.
* 1.3: slight modification of the panel and transparency.
* 1.2: some corrections and improvements + Firefox extra.
* 1.1: fixed a bug: list of grouped window applets for the left/right panels.
* 1.0: first version (Cinnamon 4).


## License

This theme is distributed under the terms of the [GPLv3.0 license.](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CBlue/LICENCE)