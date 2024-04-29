#! /usr/bin/env bash

set -Eeo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
SRC_DIR="${REPO_DIR}/src"
export LD_LIBRARY_PATH="$REPO_DIR/libsass"
SASSC_BIN="$REPO_DIR/libsass/sassc"

ctype=
ELSE_DPI=

themes=()
colors=()
sizes=()


THEME_DIR=$(dirname $REPO_DIR)
THEME_NAME=$(basename $THEME_DIR)

SASSC_OPT="-M -t expanded"

THEME_VARIANTS=('' '-purple' '-pink' '-red' '-orange' '-yellow' '-green' '-teal' '-blue')
COLOR_VARIANTS=('' '-Light' '-Dark')
SIZE_VARIANTS=('' '-compact')


if [[ "$(command -v gnome-shell)" ]]; then
  gnome-shell --version
  SHELL_VERSION="$(gnome-shell --version | cut -d ' ' -f 3 | cut -d . -f -1)"
  if [[ "${SHELL_VERSION:-}" -ge "44" ]]; then
    GS_VERSION="44-0"
  elif [[ "${SHELL_VERSION:-}" -ge "42" ]]; then
    GS_VERSION="42-0"
  elif [[ "${SHELL_VERSION:-}" -ge "40" ]]; then
    GS_VERSION="40-0"
  else
    GS_VERSION="3-28"
  fi
  else
    echo "'gnome-shell' not found, using styles for last gnome-shell version available."
    GS_VERSION="44-0"
fi

install() {
  local theme="${1}"
  local color="${2}"
  local size="${3}"
  local ctype="${4}"

  [[ "${color}" == '-Light' ]] && local ELSE_LIGHT="${color}" && local icon_color="-light"
  [[ "${color}" == '-Dark' ]] && local ELSE_DARK="${color}" && local icon_color="-dark"

  echo "Installing '${THEME_DIR}'..."

  theme_tweaks

  mkdir -p                                                                                   "${THEME_DIR}"

  echo "[Desktop Entry]" >>                                                                  "${THEME_DIR}/index.theme"
  echo "Type=X-GNOME-Metatheme" >>                                                           "${THEME_DIR}/index.theme"
  echo "Name=$THEME_NAME" >>                                                                 "${THEME_DIR}/index.theme"
  echo "Comment=An Flat Gtk+ theme based on Elegant Design" >>                               "${THEME_DIR}/index.theme"
  echo "Encoding=UTF-8" >>                                                                   "${THEME_DIR}/index.theme"
  echo "" >>                                                                                 "${THEME_DIR}/index.theme"
  echo "[X-GNOME-Metatheme]" >>                                                              "${THEME_DIR}/index.theme"
  echo "GtkTheme=$THEME_NAME" >>                                                             "${THEME_DIR}/index.theme"
  echo "MetacityTheme=$THEME_NAME" >>                                                        "${THEME_DIR}/index.theme"
  echo "IconTheme=Tela-circle${icon_color}" >>                                               "${THEME_DIR}/index.theme"
  echo "CursorTheme=Graphite${icon_color:--light}${ctype}-cursors" >>                        "${THEME_DIR}/index.theme"
  echo "ButtonLayout=close,minimize,maximize:menu" >>                                        "${THEME_DIR}/index.theme"

  mkdir -p                                                                                   "${THEME_DIR}/gnome-shell"
  cp -r "${SRC_DIR}/main/gnome-shell/pad-osd.css"                                            "${THEME_DIR}/gnome-shell"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/gnome-shell/gnome-shell${color}.scss"               "${THEME_DIR}/gnome-shell/gnome-shell.css"

  cp -r "${SRC_DIR}/assets/gnome-shell/common-assets"                                        "${THEME_DIR}/gnome-shell/assets"
  cp -r "${SRC_DIR}/assets/gnome-shell/assets${ELSE_DARK:-}/"*.svg                           "${THEME_DIR}/gnome-shell/assets"
  cp -r "${SRC_DIR}/assets/gnome-shell/theme${theme}${ctype}/"*.svg                          "${THEME_DIR}/gnome-shell/assets"

  cd "${THEME_DIR}/gnome-shell"
  ln -s assets/no-events.svg no-events.svg
  ln -s assets/process-working.svg process-working.svg
  ln -s assets/no-notifications.svg no-notifications.svg

  mkdir -p                                                                                   "${THEME_DIR}/gtk-2.0"
  cp -r "${SRC_DIR}/main/gtk-2.0/gtkrc${theme}${ELSE_DARK:-}${ctype}"                        "${THEME_DIR}/gtk-2.0/gtkrc"
  cp -r "${SRC_DIR}/main/gtk-2.0/common/"*'.rc'                                              "${THEME_DIR}/gtk-2.0"
  cp -r "${SRC_DIR}/assets/gtk-2.0/assets-common${ELSE_DARK:-}${ctype}"                      "${THEME_DIR}/gtk-2.0/assets"
  cp -r "${SRC_DIR}/assets/gtk-2.0/assets${theme}${ELSE_DARK:-}${ctype}/"*.png               "${THEME_DIR}/gtk-2.0/assets"

  mkdir -p                                                                                   "${THEME_DIR}/gtk-3.0"
  cp -r "${SRC_DIR}/assets/gtk/assets${theme}"                                               "${THEME_DIR}/gtk-3.0/assets"
  cp -r "${SRC_DIR}/assets/gtk/scalable"                                                     "${THEME_DIR}/gtk-3.0/assets"
  cp -r "${SRC_DIR}/assets/gtk/thumbnail${ELSE_DARK:-}.png"                                  "${THEME_DIR}/gtk-3.0/thumbnail.png"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/gtk-3.0/gtk${color}.scss"                           "${THEME_DIR}/gtk-3.0/gtk.css"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/gtk-3.0/gtk-Dark.scss"                              "${THEME_DIR}/gtk-3.0/gtk-dark.css"

  mkdir -p                                                                                   "${THEME_DIR}/gtk-4.0"
  cp -r "${SRC_DIR}/assets/gtk/assets${theme}"                                               "${THEME_DIR}/gtk-4.0/assets"
  cp -r "${SRC_DIR}/assets/gtk/scalable"                                                     "${THEME_DIR}/gtk-4.0/assets"
  cp -r "${SRC_DIR}/assets/gtk/thumbnail${ELSE_DARK:-}.png"                                  "${THEME_DIR}/gtk-4.0/thumbnail.png"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/gtk-4.0/gtk${color}.scss"                           "${THEME_DIR}/gtk-4.0/gtk.css"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/gtk-4.0/gtk-Dark.scss"                              "${THEME_DIR}/gtk-4.0/gtk-dark.css"

  mkdir -p                                                                                   "${THEME_DIR}/cinnamon"
  cp -r "${SRC_DIR}/assets/cinnamon/common-assets"                                           "${THEME_DIR}/cinnamon/assets"
  cp -r "${SRC_DIR}/assets/cinnamon/assets${ELSE_DARK:-}/"*'.svg'                            "${THEME_DIR}/cinnamon/assets"
  cp -r "${SRC_DIR}/assets/cinnamon/theme${theme}/"*'.svg'                                   "${THEME_DIR}/cinnamon/assets"
  $SASSC_BIN $SASSC_OPT "${SRC_DIR}/main/cinnamon/cinnamon${color}.scss"                     "${THEME_DIR}/cinnamon/cinnamon.css"
  cp -r "${SRC_DIR}/assets/cinnamon/thumbnail${color}.png"                                   "${THEME_DIR}/cinnamon/thumbnail.png"

  mkdir -p                                                                                   "${THEME_DIR}/metacity-1"
  cp -r "${SRC_DIR}/main/metacity-1/metacity-theme-2${color}.xml"                            "${THEME_DIR}/metacity-1/metacity-theme-2.xml"
  cp -r "${SRC_DIR}/main/metacity-1/metacity-theme-3.xml"                                    "${THEME_DIR}/metacity-1"
  cp -r "${SRC_DIR}/assets/metacity-1/assets"                                                "${THEME_DIR}/metacity-1"
  cp -r "${SRC_DIR}/assets/metacity-1/thumbnail${ELSE_DARK:-}.png"                           "${THEME_DIR}/metacity-1/thumbnail.png"
  cd "${THEME_DIR}/metacity-1" && ln -s metacity-theme-2.xml metacity-theme-1.xml

  mkdir -p                                                                                   "${THEME_DIR}/xfwm4"
  cp -r "${SRC_DIR}/assets/xfwm4/assets${ELSE_LIGHT:-}${ctype}${ELSE_DPI:-}/"*.png           "${THEME_DIR}/xfwm4"
  cp -r "${SRC_DIR}/main/xfwm4/themerc${ELSE_LIGHT:-}"                                       "${THEME_DIR}/xfwm4/themerc"

  mkdir -p                                                                                   "${THEME_DIR}/plank"
  if [[ "$color" == '-Light' ]]; then
    cp -r "${SRC_DIR}/main/plank/theme-Light/"*                                              "${THEME_DIR}/plank"
  else
    cp -r "${SRC_DIR}/main/plank/theme-Dark/"*                                               "${THEME_DIR}/plank"
  fi
}

while [[ $# -gt 0 ]]; do
  case "${1}" in
    -c|--color)
      shift
      for color in "${@}"; do
        case "${color}" in
          standard)
            colors+=("${COLOR_VARIANTS[0]}")
            lcolors+=("${COLOR_VARIANTS[0]}")
            gcolors+=("${COLOR_VARIANTS[0]}")
            shift
            ;;
          light)
            colors+=("${COLOR_VARIANTS[1]}")
            lcolors+=("${COLOR_VARIANTS[1]}")
            gcolors+=("${COLOR_VARIANTS[1]}")
            shift
            ;;
          dark)
            colors+=("${COLOR_VARIANTS[2]}")
            lcolors+=("${COLOR_VARIANTS[2]}")
            gcolors+=("${COLOR_VARIANTS[2]}")
            shift
            ;;
          -*|--*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized color variant '$1'."
            echo "Ignoring..."
            shift
            ;;
        esac
      done
      ;;
    -t|--theme)
      accent='true'
      shift
      for variant in "$@"; do
        case "$variant" in
          default)
            themes+=("${THEME_VARIANTS[0]}")
            shift
            ;;
          purple)
            themes+=("${THEME_VARIANTS[1]}")
            shift
            ;;
          pink)
            themes+=("${THEME_VARIANTS[2]}")
            shift
            ;;
          red)
            themes+=("${THEME_VARIANTS[3]}")
            shift
            ;;
          orange)
            themes+=("${THEME_VARIANTS[4]}")
            shift
            ;;
          yellow)
            themes+=("${THEME_VARIANTS[5]}")
            shift
            ;;
          green)
            themes+=("${THEME_VARIANTS[6]}")
            shift
            ;;
          teal)
            themes+=("${THEME_VARIANTS[7]}")
            shift
            ;;
          blue)
            themes+=("${THEME_VARIANTS[8]}")
            shift
            ;;
          all)
            themes+=("${THEME_VARIANTS[@]}")
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized theme variant '$1'."
            echo "Ignoring..."
            shift
            ;;
        esac
      done
      ;;
    -s|--size)
      shift
      for variant in "$@"; do
        case "$variant" in
          standard)
            sizes+=("${SIZE_VARIANTS[0]}")
            shift
            ;;
          compact)
            sizes+=("${SIZE_VARIANTS[1]}")
            compact='true'
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized size variant '${1:-}'."
            echo "Ignoring..."
            shift
            ;;
        esac
      done
      ;;
    --xfwmdpi)
      shift
      for variant in "$@"; do
        case "$variant" in
          standard)
            ELSE_DPI=
            shift
            ;;
          hdpi)
            ELSE_DPI=-hdpi
            shift
            ;;
          xhdpi)
            ELSE_DPI=-xhdpi
            shift
            ;;
          -*)
            break
            ;;
          *)
            echo "ERROR: Unrecognized xfwm4 dpi variant '${1:-}'."
            echo "Ignoring..."
            shift
            ;;
        esac
      done
      ;;
    --nord)
      nord="true"
      ctype="-nord"
      echo -e "Install Nord version! ..."
      shift
      ;;
    --black)
      blackness="true"
      echo -e "Install Blackness version! ..."
      shift
      ;;
    --darker)
      darker="true"
      echo -e "Install darker version! ..."
      shift
      ;;
    --rimless)
      rimless="true"
      echo -e "Install Rimless version! ..."
      shift
      ;;
    --normal)
      normal="true"
      echo -e "Install Normal sidebar version! ..."
      shift
      ;;
    --float)
      float="true"
      echo -e "Install Float Gnome-Shell Panel version! ..."
      shift
      ;;
    --colorful)
      colorful="true"
      echo -e "Install Colorful Gnome-Shell Panel version! ..."
      shift
      ;;
    *)
      echo "ERROR: Unrecognized installation option '$1'."
      echo "Ignoring..."
      shift
      ;;
  esac
done

if [[ "${#themes[@]}" -eq 0 ]] ; then
  themes=("${THEME_VARIANTS[0]}")
fi

if [[ "${#colors[@]}" -eq 0 ]] ; then
  colors=("${COLOR_VARIANTS[@]}")
fi

if [[ "${#lcolors[@]}" -eq 0 ]] ; then
  lcolors=("${COLOR_VARIANTS[1]}")
fi

if [[ "${#gcolors[@]}" -eq 0 ]] ; then
  gcolors=("${COLOR_VARIANTS[2]}")
fi

if [[ "${#sizes[@]}" -eq 0 ]] ; then
  sizes=("${SIZE_VARIANTS[0]}")
fi

sass_temp() {
  cp -rf ${SRC_DIR}/sass/gnome-shell/_common.scss ${SRC_DIR}/sass/gnome-shell/_common-temp.scss
  cp -rf ${SRC_DIR}/sass/_tweaks.scss ${SRC_DIR}/sass/_tweaks-temp.scss
}

compact_size() {
  sed -i "/\$compact:/s/false/true/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

nord_color() {
  sed -i "/\$color_type:/s/default/nord/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

blackness_color() {
  sed -i "/\$color_type:/s/default/blackness/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

darker_color() {
  sed -i "/\$darker:/s/false/true/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

border_rimless() {
  sed -i "/\$rimless:/s/false/true/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

normal_sidebar() {
  sed -i "/\$sidebar:/s/styled/normal/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

float_panel() {
  sed -i "/\$float:/s/false/true/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

colorful_panel() {
  sed -i "/\$colorful:/s/false/true/" ${SRC_DIR}/sass/_tweaks-temp.scss
}

gnome_shell_version() {
  sed -i "/\widgets/s/40-0/${GS_VERSION}/" ${SRC_DIR}/sass/gnome-shell/_common-temp.scss

  if [[ "${GS_VERSION}" == '3-28' ]]; then
    sed -i "/\extensions/s/40-0/${GS_VERSION}/" ${SRC_DIR}/sass/gnome-shell/_common-temp.scss
  fi
}

theme_color() {
  if [[ "$theme" != '' ]]; then
    case "$theme" in
      -purple)
        theme_color='purple'
        ;;
      -pink)
        theme_color='pink'
        ;;
      -red)
        theme_color='red'
        ;;
      -orange)
        theme_color='orange'
        ;;
      -yellow)
        theme_color='yellow'
        ;;
      -green)
        theme_color='green'
        ;;
      -teal)
        theme_color='teal'
        ;;
      -blue)
        theme_color='blue'
        ;;
    esac
    sed -i "/\$theme:/s/default/${theme_color}/" ${SRC_DIR}/sass/_tweaks-temp.scss
  fi
}

theme_tweaks() {
  cp -rf ${SRC_DIR}/sass/_tweaks.scss ${SRC_DIR}/sass/_tweaks-temp.scss

  if [[ "$accent" = "true" ]] ; then
    theme_color
  fi

  if [[ "$compact" = "true" ]] ; then
    compact_size
  fi

  if [[ "$nord" = "true" ]] ; then
    nord_color
  fi

  if [[ "$blackness" = "true" ]] ; then
    blackness_color
  fi

  if [[ "$darker" = "true" ]] ; then
    darker_color
  fi

  if [[ "$rimless" = "true" ]] ; then
    border_rimless
  fi

  if [[ "$normal" = "true" ]] ; then
    normal_sidebar
  fi

  if [[ "$float" = "true" ]] ; then
    float_panel
  fi

  if [[ "$colorful" = "true" ]] ; then
    colorful_panel
  fi
}

clean_theme() {
  rm -rf "${THEME_DIR}"/{cinnamon,gnome-shell,gtk-2.0,gtk-3.0,gtk-4.0,metacity-1,plank,xfwm4,index.theme}
}

install_theme() {
  for theme in "${themes[@]}"; do
    for color in "${colors[@]}"; do
      for size in "${sizes[@]}"; do
        install "$theme" "$color" "$size" "$ctype"
      done
    done
  done
}

clean_theme && sass_temp && gnome_shell_version && install_theme

echo
echo Done.
