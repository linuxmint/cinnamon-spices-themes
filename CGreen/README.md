## CGreen

#### A semi-transparent Cinnamon theme, with Firefox extra. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `300` of the file `~/.themes/CGreen/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.


## Firefox extra

### This is a css file that changes the color of the address bar according to the security of a site:
Just copy the file `~/.themes/CGreen/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.

### From Firefox 69 and after:
You must type `about:config` in the address bar and then modify the value `toolkit.legacyUserProfileCustomizations.stylesheets` by double-clicking on it to switch it to `TRUE`.


![example](https://i.postimg.cc/L8G7tSsw/extra.png)

**Without this modification, the extra doesn't work.**


## Versions

* 1.4: workspace-graph editing.
* 1.3: slight panel touch-ups.
* 1.2: instruction for the extra from Firefox 69.
* 1.1: modification of the workspace applet (visual representation).
* 1.0: first version (Cinnamon 4).


## License

This theme is distributed under the terms of the [GPLv3.0 license.](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CGreen/LICENCE)