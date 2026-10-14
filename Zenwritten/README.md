# Zenwritten

A greyscale dark theme for Cinnamon: zenwritten's greys for surfaces, borders
and controls, no accent colour, and the semantic roles below as the only hues.
Ships the shell theme, GTK 2/3/4 and Muffin's window decorations.

The palette is that of *zenwritten*, the zero-hue, zero-saturation greyscale
variant of [zenbones](https://github.com/mcchrish/zenbones.nvim). Body text is
`#bbbbbb`; `#FFF` is reserved for titles and selected labels, which need the
extra contrast. Destructive actions carry black text; light text does not read
against the rose. Where GTK asks for a colour by role — success, warning, error,
destructive — the coloured value is kept rather than greyed, so a warning banner
does not read as a success one. Everything else is on the grey ramp.

## Install

Copy the theme directory into your user themes folder:

    mkdir -p ~/.themes
    cp -r Zenwritten/files/Zenwritten ~/.themes/Zenwritten

Substitute `~/.local/share/themes/` for `~/.themes/` if you prefer the XDG path,
or `/usr/share/themes/` to install for every user.

Then pick `Zenwritten` under Settings → Themes → Desktop. `index.theme` names
the GTK and Metacity themes, so Controls and Window borders follow; your icons
and cursor are left alone.

### Only if you use Nemo

Nemo registers a stylesheet above any theme, so a handful of rules the theme
carries cannot reach it from inside the theme. Copy the companion sheet:

    mkdir -p ~/.config/gtk-3.0
    cp Zenwritten/files/Zenwritten/gtk-3.0/user-overrides.css ~/.config/gtk-3.0/gtk.css

It assumes the theme underneath and is not a standalone sheet.

## Credit

A derivative work; see `COPYING`.

- **zenbones / zenwritten** by mcchrish (MIT) — the theme's name, its palette,
  and its approach.
- **Cinnamon's stock theme** — the shell theme is a modified copy of
  `/usr/share/cinnamon/theme/cinnamon.css` (GPL-2.0-or-later). The images
  alongside it are Cinnamon's, recoloured to the palette.
- **Orchis** by vinceliuice (GPL-3.0) — the GTK and window-decoration base,
  shipped here with this theme's overrides appended.

GPL-3.0; see `COPYING`.
