# Railway Cinnamon theme
> For those who like _Doors 8_ style

[![](screenshot.png)][repo]

## Installation
### From source
Run `./install.sh` or move the `Railway` folder into your `~/.themes` folder.

### Cinnamon Spices
Download it from [here][spices] or search for "Railway" in your Cinnamon theme settings.

---
## Developing
Run `./utils.sh --watch` to automatically reload the theme. It will create a link in `~/.themes`.

### Contributing
Contributions are accepted via GitHub pull requests. Please, run `./utils.sh --compile` before submitting a pull request. Also if you modify any image resource, run `./utils.sh --simplify`.

### Dependencies
* `inotifywait (inotify-tools)`: watch for changes
* `sassc`: compile sass files
* `scour`: remove svg metadata

**NOTE**: never edit CSS files directly. They are overriden at build.

## Credits
Special thanks to @zagortenay333 for the codebase.

[repo]: https://github.com/germanfr/railway-cinnamon
[spices]: https://cinnamon-spices.linuxmint.com/themes
