# [Railway Cinnamon theme][repo]
> For those who like _Doors 8_ style, in spite of everything

[![](screenshots/screenshot.png)][repo]

## Installation
#### From source
Run `make install` or move the `Railway` folder into your `~/.themes` folder.

#### Cinnamon Spices
Download it from [here][spices] or search for "Railway" in your Cinnamon theme settings.

### Color customization
You can get some prebuilt **color variations** from [the repository archive][archive]. You'll have to install them manually by copying the themes into your `~/.themes` folder.

To **create a custom color** variation of the theme you need to install it [from source][repo] in order to get the original code and scripts.
Once you have it run `make color=COLOR`, where `COLOR` is the hexadecimal color without `#`. For example `make color=FF00FF`. Then run `make install`.

---
## Developing
Run `./utils.sh --watch` to automatically compile and reload the theme. It will create a link in `~/.themes`.

_It's important to run utils.sh from its containing directory._

### Contributing
Contributions are accepted via GitHub pull requests [here][repo]. Please, if you modify any image resource, run `./utils.sh --simplify` before creating a commit.

**IMPORTANT**: Never edit CSS files directly. They are overriden at build.

### Build dependencies
* `sassc`: compile sass files
* `inotifywait (inotify-tools)`: watch for changes (optional)
* `scour`: remove svg metadata (optional)

## Credits
Special thanks to [@zagortenay333](https://github.com/zagortenay333) for the codebase.

[repo]: https://github.com/germanfr/railway-cinnamon
[spices]: https://cinnamon-spices.linuxmint.com/themes/view/Railway
[archive]: https://github.com/germanfr/railway-cinnamon/releases
