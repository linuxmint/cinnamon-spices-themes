## CGreen

### A semi-transparent Cinnamon theme, with Firefox extra and Conky. Inspired by the CBlack theme (author: cloweling).
If you want a panel that is not transparent, modify the line `300` of the file `~/.themes/CGreen/cinnamon/cinnamon.css`.
For example: background-color: rgba(53, 57, 69, `0.50`); . A value of `0` is equivalent to total transparency and `1` is totally opaque. Restart Cinnamon (Ctrl+Alt+Esc) for immediate modification.


## Firefox extra

#### This is a css file that changes the color of the address bar according to the security of a site:
Just copy the file `~/.themes/CGreen/cinnamon/userChrome.css` and paste it into `~/.mozilla/firefox/YOUR_PROFILE/chrome/`. If the `chrome` directory is not present in your profile, you will need to create it.

#### From Firefox 69 and after:
You must type `about:config` in the address bar and then modify the value `toolkit.legacyUserProfileCustomizations.stylesheets` by double-clicking on it to switch it to `TRUE`.

![example](https://i.postimg.cc/L8G7tSsw/extra.png)

#### From Firefox 77 and after:
You need to reinstall the `userChrome.css` file in the Firefox profile. To make sure you get the latest version of the theme, follow this [link](https://cinnamon-spices.linuxmint.com/files/themes/CGreen.zip?).

**Without this modifications, the extra doesn't work.**


## Conky

* Install the `conky` or `conky-all` package, depending on the GNU/Linux distribution. `curl` must already be present, if it isn't, you should install it as well.

* Download the Brizel font [here](https://dl.dafont.com/dl/?f=brizel), then unzip into `~/.local/share/fonts`. The `fc-cache -f -v` command may be needed to update the fonts.

* Copy the file located in `~/.themes/CGreen/cinnamon/TimeFull` and paste it into `~/.conky` (these are hidden folders: Ctrl+h to show them). You must also allow the file to run with the command `chmod 750 ~/.conky/TimeFull`. More informations can be found at the beginning of the file.


## Versions

* 1.9: instruction for the extra from Firefox 77 and update userChrome.css file.
* 1.8: correction of the menu display (official and alternatives) + modification of the IP URL in Conky.
* 1.7: add conky.
* 1.6: fixes the workspace-switcher offset.
* 1.5: fixed a bug in the panel-launchers applet for vertical panels, magnification of some panel elements.
* 1.4: workspace-graph editing.
* 1.3: slight panel touch-ups.
* 1.2: instruction for the extra from Firefox 69.
* 1.1: modification of the workspace applet (visual representation).
* 1.0: first version (Cinnamon 4).


## License

This theme is distributed under the terms of the [GPLv3.0 license.](https://raw.githubusercontent.com/linuxmint/cinnamon-spices-themes/master/CGreen/LICENCE).
