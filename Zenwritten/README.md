# Zenwritten

A greyscale dark theme for Cinnamon: zenwritten's greys for surfaces, borders and
controls, white text, translucent surfaces, and no accent colour — one rose for
destructive actions. Ships the shell theme, GTK 2/3/4 and Muffin's window
decorations.

The palette is that of *zenwritten*, the zero-hue, zero-saturation greyscale
variant of [zenbones](https://github.com/mcchrish/zenbones.nvim). The theme writes
`#ffffff` for text where that palette states `#bbbbbb`: `#bbbbbb` at the alphas a
stylesheet states its secondary text in composites too dim to read. Where an
application asks for a colour by role — success, warning, info, visited — the
zenbones semantic is kept rather than greyed.

## Install

Pick `Zenwritten` under Settings → Themes → Desktop.

The theme names `Colloid-Panel` for icons. Install
[Colloid](https://github.com/vinceliuice/Colloid-icon-theme) (or the panel icon
overrides apply to nothing — everything else works either way).

## Credit

A derivative work; see `COPYING`.

- **zenbones / zenwritten** — [zenbones.nvim](https://github.com/mcchrish/zenbones.nvim)
  by mcchrish, MIT: the theme's name, its palette, and its approach.
- **Cinnamon's stock theme** — the shell theme is a modified copy of
  `/usr/share/cinnamon/theme/cinnamon.css` (GPL-2.0-or-later). The images
  alongside it are Cinnamon's, recoloured to the palette.
- **Orchis** — [vinceliuice/Orchis-theme](https://github.com/vinceliuice/Orchis-theme),
  GPL-3.0: the GTK and window-decoration base, shipped here with this theme's
  overrides appended.

GPL-3.0; see `COPYING`.
