# Orchidea Theme

A theme inspired by vinceliuice's Orchis Theme
([https://github.com/vinceliuice/Orchis-theme](https://github.com/vinceliuice/Orchis-theme)).

<!-- It comes in multiple variants: you can choose between light or dark version and
8 different accent colors from the vinceliuice's theme (blue, green, grey,
orange, pink, purple, red, yellow). -->

## License

See [LICENSE](./LICENSE) file.

## Credits

To the original creator of [Orchis
Theme](https://github.com/vinceliuice/Orchis-theme) for the assets and some
snippets of source code from the original theme.

-----

## Development section

### Build

Theme (in all variants) can be built using the script `build.js`. Output
files will be written in `./files` folder.

```sh
node ./build.js
```

### Development

Use following command to quickly compile sass files:

```sh
# Compile Orange Dark theme variant
sass src/cinnamon-orange-dark.scss files/Orchidea-orange-dark/cinnamon/cinnamon.css --no-source-map --watch
```
