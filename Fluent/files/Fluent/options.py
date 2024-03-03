#!/usr/bin/python3

import os
from gi.repository import Gio
import subprocess
from config import config_gui
import time

'''
$XDG_CURRENT_DESKTOP values:
Cinnamon: "X-Cinnamon"
GNOME: "GNOME"
MATE: "MATE"
XFCE: "XFCE"
pop: "pop:GNOME"
Pantheon: "Pantheon"

Desktops:
GNOME, XFCE (xubuntu 23, Manjaro xfce 22), MATE, Unity (Ubuntu Unity 23): Works OK
Cinnamon, Pantheon (elementaryos-7): Works OK, but don't know how to update wm
    theme without renaming theme
pop (popOS 22): Treat as GNOME but doesn't seem to affect some gtk3 apps or wm
    theme (and neither does GNOME tweaks)
Budgie (Ubuntu Budgie 23): Works OK, but don't know how to update wm theme without
    renaming theme and have to set org.gnome.desktop.interface color-scheme as it changes
    to "prefer-dark" each time.
'''
rename_theme_on_update = False
desktop_environment = os.environ.get('XDG_CURRENT_DESKTOP')
if not desktop_environment:
    desktop_environment = "Unknown"
elif "Budgie" in desktop_environment:
    desktop_environment = 'Budgie'
    rename_theme_on_update = True
elif "Unity" in desktop_environment:
    desktop_environment = 'Unity'
elif "pop" in desktop_environment:
    desktop_environment = 'pop'
elif "GNOME" in desktop_environment:
    desktop_environment = 'GNOME'
elif "Cinnamon" in desktop_environment:
    desktop_environment = "Cinnamon"
    rename_theme_on_update = True
elif "MATE" in desktop_environment:
    desktop_environment = "MATE"
elif "XFCE" in desktop_environment:
    desktop_environment = "XFCE"
elif "Pantheon" in desktop_environment:
    desktop_environment = "Pantheon"
    rename_theme_on_update = True
else:
    desktop_environment = "Unknown"

print(f"Desktop environment is: {desktop_environment}...")

def gsettings_get(schema, key):
    if Gio.SettingsSchemaSource.get_default().lookup(schema, True) is not None:
        setting = Gio.Settings.new(schema)
        return setting.get_string(key)
    else:
        return ""

def gsettings_set(schema, key, old_value, new_value, reload_only):
    if not reload_only or gsettings_get(schema, key) == old_value:
        if Gio.SettingsSchemaSource.get_default().lookup(schema, True) is not None:
            print ("gsettings resetting " + schema + " " + key)
            setting = Gio.Settings.new(schema)
            if new_value == old_value:
                setting.set_string(key, "")
            setting.set_string(key, new_value)

def xfconf_get(channel, key):
    try:
        command = ["xfconf-query", "-c", channel, "-p", key]
        output = subprocess.check_output(command, text=True)
    except Exception as e:
        print("xfconf-query error: ", e)
        output = ""
    return output.rstrip("\n")

def xfconf_set(channel, key, theme_name, reload_only):
    if not reload_only or xfconf_get(channel, key) == theme_name:
        print ("xfconf-query resetting ", channel, key)
        subprocess.run(["xfconf-query", "-c", channel, "-p", key, "-r"])
        subprocess.run(["xfconf-query", "-c", channel, "-p", key, "-s", theme_name])

def is_current_theme(current_theme_name):
    if desktop_environment in {"GNOME", "pop", "Pantheon", "Budgie", "Unity"}:
        return gsettings_get("org.gnome.desktop.interface",
                                        "gtk-theme") == current_theme_name
    elif desktop_environment == "Cinnamon":
        return gsettings_get("org.cinnamon.desktop.interface",
                                        "gtk-theme") == current_theme_name
        #return gsettings_get("org.cinnamon.theme", "name") == current_theme_name
    elif desktop_environment == "XFCE":
        return xfconf_get("xsettings", "/Net/ThemeName") == current_theme_name
    elif desktop_environment == "MATE":
        return gsettings_get("org.mate.interface", "gtk-theme") == current_theme_name

def set_theme(current_theme_name, new_theme_name, reload_only):
    if desktop_environment in {"GNOME", "pop", "Pantheon"}:
        gsettings_set("org.gnome.desktop.interface", "gtk-theme",
                    current_theme_name, new_theme_name, reload_only)
    elif desktop_environment == "Cinnamon":
        gsettings_set("org.cinnamon.desktop.interface", "gtk-theme",
                            current_theme_name, new_theme_name, reload_only)
        gsettings_set("org.cinnamon.theme", "name", current_theme_name,
                                            new_theme_name, reload_only)
    elif desktop_environment == "XFCE":
        xfconf_set("xsettings", "/Net/ThemeName", current_theme_name, reload_only)
        #xfconf_set("xfwm4", "/general/theme", current_theme_name, reload_only)
    elif desktop_environment == "MATE":
        gsettings_set("org.mate.interface", "gtk-theme",
                            current_theme_name, new_theme_name, reload_only)
    elif desktop_environment == "Budgie":
        setting = Gio.Settings.new("org.gnome.desktop.interface")
        current_color_scheme = setting.get_string("color-scheme")
        gsettings_set("org.gnome.desktop.interface", "gtk-theme",
                            current_theme_name, new_theme_name, reload_only)
        time.sleep(1)
        setting.set_string("color-scheme", current_color_scheme)
    elif desktop_environment == "Unity":
        gsettings_set("org.gnome.desktop.interface", "gtk-theme",
                            current_theme_name, new_theme_name, reload_only)
        gsettings_set("org.gnome.desktop.wm.preferences", "theme",
                            current_theme_name, new_theme_name, reload_only)
    
if __name__ == "__main__":
    config_gui.main(desktop_environment, rename_theme_on_update,
                                            is_current_theme, set_theme)
