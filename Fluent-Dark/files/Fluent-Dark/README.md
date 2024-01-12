## Fluent-Dark

Version: _2023.12.16_

Theme supports gtk2, gtk3, gtk4, and cinnamon.

I have uploaded this theme here for convenience only. All credit goes to the original author(s). See [https://github.com/vinceliuice/Fluent-gtk-theme](https://github.com/vinceliuice/Fluent-gtk-theme) for more information.

For theme and color variations see theme homepage linked above or visit theme page on [Pling.com](https://www.gnome-look.org/p/1477941)

## Installation

Most easily installed via Cinnamon's Themes module in Cinnamon settings.

To allow the GTK2, GTK3, and GTK4 themes to apply to GUI apps running as root, run this command in your terminal after installation to create a symlink to the theme in the local system theme directory.

`sudo mkdir -p /usr/local/share/themes; sudo ln -s ~/.themes/Fluent-Dark /usr/local/share/themes/`

### Libadwaita

To style libadwaita applications, you'll need to create links of the contents of the folder (not the folder itself) `~/.themes/Fluent-Dark/gtk-4.0/` into the folder `~/.config/gtk-4.0/` You can do this using the following command in a terminal:

`ln -sf ~/.themes/Fluent-Dark/gtk-4.0/* ~/.config/gtk-4.0/`

Note that this will overwrite any existing libadwaita theme you may have installed in `~/.config/gtk-4.0/` so you may want to first make a backup of any existing files and subdirectories you have in there if you want to keep them. If you want to return to using the default libadwaita theme, just delete the all the files and subdirectories in `~/.config/gtk-4.0/`
