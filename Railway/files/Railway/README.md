# [Railway Cinnamon theme][repo]
> For those who like _Doors 8_ style, in spite of everything

[![](screenshot.png)][repo]

## Installation
### From source
Run `make install` or move the `Railway` folder into your `~/.themes` folder.

### Cinnamon Spices
Download it from [here][spices] or search for "Railway" in your Cinnamon theme settings.

### Color customization
To change the accent color of the theme you need to install it [from source][repo] in order to get the original code and scripts.
Once you have it run `make color=COLOR`, where `COLOR` is the hexadecimal color without `#`. For example `make color=FF00FF`. Then run `make install`.

---
## Developing
Run `./utils.sh --watch` to automatically compile and reload the theme. It will create a link in `~/.themes`.

_It's important to run utils.sh from its containing directory._

### Contributing
Contributions are accepted via GitHub pull requests [here][repo]. Please, if you modify any image resource, run `./utils.sh --simplify` before creating a commit.

**NOTE**: never edit CSS files directly. They are overriden at build.

### Build dependencies
* `inotifywait (inotify-tools)`: watch for changes
* `sassc`: compile sass files
* `scour`: remove svg metadata

## Credits
Special thanks to [@zagortenay333](https://github.com/zagortenay333) for the codebase.

[repo]: https://github.com/germanfr/railway-cinnamon
[spices]: https://cinnamon-spices.linuxmint.com/themes/view/Railway
