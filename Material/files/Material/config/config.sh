#!/bin/bash

script_dir=$(dirname "$0")
cd "$script_dir"

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

THEME_DIR=$(dirname $REPO_DIR)
THEME_NAME=$(basename $THEME_DIR)

borderless="false"
legacybuttons="false"
colorscheme="DeepOcean"

while [[ "$#" -gt 0 ]]; do
  case "${1:-}" in
    --borderless)
      borderless="true"
      shift
      ;;
    --legacybuttons)
      legacybuttons="true"
      shift
      ;;
    --colorscheme)
      shift
      for variant in "$@"; do
        case "$variant" in
          DeepOcean)
            colorscheme='DeepOcean'
            shift
            ;;
          Palenight)
            colorscheme='Palenight'
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized colorscheme '$1'."
            echo "Ignoring..."
            shift
            ;;
        esac
      done
      ;;
    *)
      echo "ERROR: Unrecognized config option '${1:-}'."
      echo "Ignoring..."
      shift
      ;;
  esac
done

# clean theme
rm -rf ../{cinnamon,gnome-shell,gtk-2.0,gtk-3.0,gtk-4.0,metacity-1,xfwm4,index.theme}

# install theme
echo "Configuring theme..."

cp -r common/{cinnamon,gnome-shell,gtk-3.0,gtk-4.0} ../

if [[ "$colorscheme" == 'DeepOcean' ]]; then
    echo "Installing DeepOcean..."
    cp -r DeepOcean-B/gtk-2.0 ../
    if [[ "$borderless" == 'false' ]]; then
        cp DeepOcean-B/cinnamon/cinnamon.css ../cinnamon/
        cp DeepOcean-B/gnome-shell/gnome-shell.css ../gnome-shell/
        if [[ "$legacybuttons" == 'false' ]]; then
            cp DeepOcean-B/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp DeepOcean-B/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r DeepOcean-B/xfwm4 ../
        else
            cp DeepOcean-B-LB/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp DeepOcean-B-LB/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r DeepOcean-B-LB/xfwm4 ../
        fi
    else
        cp DeepOcean-BL/cinnamon/cinnamon.css ../cinnamon/
        cp DeepOcean-BL/gnome-shell/gnome-shell.css ../gnome-shell/
        if [[ "$legacybuttons" == 'false' ]]; then
            cp DeepOcean-BL/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp DeepOcean-BL/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r DeepOcean-BL/xfwm4 ../
        else
            cp DeepOcean-BL-LB/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp DeepOcean-BL-LB/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r DeepOcean-BL-LB/xfwm4 ../
        fi
    fi
    if [[ "$legacybuttons" == 'false' ]]; then
        cp -r DeepOcean-B/metacity-1 ../
    else
        cp -r DeepOcean-B-LB/metacity-1 ../
    fi
else
    echo "Installing Palenight..."
    cp -r Palenight-B/gtk-2.0 ../
    if [[ "$borderless" == 'false' ]]; then
        cp Palenight-B/cinnamon/cinnamon.css ../cinnamon/
        cp Palenight-B/gnome-shell/gnome-shell.css ../gnome-shell/
        if [[ "$legacybuttons" == 'false' ]]; then
            cp Palenight-B/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp Palenight-B/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r Palenight-B/xfwm4 ../
        else
            cp Palenight-B-LB/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp Palenight-B-LB/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r Palenight-B-LB/xfwm4 ../
        fi
    else
        cp Palenight-BL/cinnamon/cinnamon.css ../cinnamon/
        cp Palenight-BL/gnome-shell/gnome-shell.css ../gnome-shell/
        if [[ "$legacybuttons" == 'false' ]]; then
            cp Palenight-BL/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp Palenight-BL/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r Palenight-BL/xfwm4 ../
        else
            cp Palenight-BL-LB/gtk-3.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-3.0/
            cp Palenight-BL-LB/gtk-4.0/{gtk.css,gtk-dark.css,thumbnail.png} ../gtk-4.0/
            cp -r Palenight-Bl-LB/xfwm4 ../
        fi
    fi
    if [[ "$legacybuttons" == 'false' ]]; then
        cp -r Palenight-B/metacity-1 ../
    else
        cp -r Palenight-B-LB/metacity-1 ../
    fi
fi

echo "[Desktop Entry]" >>                                                     "../index.theme"
echo "Type=X-GNOME-Metatheme" >>                                              "../index.theme"
echo "Name=Material" >>                                                       "../index.theme"
echo "Comment=An Materia Gtk+ theme based on Elegant Design" >>               "../index.theme"
echo "Encoding=UTF-8" >>                                                      "../index.theme"
echo "" >>                                                                    "../index.theme"
echo "[X-GNOME-Metatheme]" >>                                                 "../index.theme"
echo "GtkTheme=$THEME_NAME" >>                                                "../index.theme"
echo "MetacityTheme=$THEME_NAME" >>                                           "../index.theme"
echo "IconTheme=Material-$colorscheme" >>                                     "../index.theme"
echo "CursorTheme=Material-$colorscheme" >>                                   "../index.theme"
echo "ButtonLayout=close,minimize,maximize:menu" >>                           "../index.theme"

echo
echo "Done."
