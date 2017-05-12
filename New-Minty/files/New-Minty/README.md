# New-Minty with joined menus for Cinnamon

> This is a fork of the New-Minty theme with some variations.


## Installation

Move the `New-Minty` folder into your `~/.themes` directory.


## Compatibility

The latest version of this theme is on the master branch, and it supports
cinnamon version `3.2`.

For older versions, check the available [releases](../../releases).


## Font

The default font is `Liberation Sans` with `FreeSans` and `Roboto` fallbacks.

To change the font, edit the `cinnamon.css` file at selector `stage`
(beginning of file).


## Menu Icons

Check out the `menu-icons` dir which contains a lot of cool menu icons. :yum:


## Development

The `watch` script will watch the chosen dirs for changes and
recompile sass and reload the theme when a change occurs.

 * **Script dependencies:**
  * inotifywait
  * sassc

> **NOTE:**  
> The script creates a link to the `New-Minty` dir in `~/.themes`.
