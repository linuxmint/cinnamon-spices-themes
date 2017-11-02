# [Railway Cinnamon theme][repo]
> For those who like _Doors 8_ style, in spite of everything

Website: [https://github.com/germanfr/railway-cinnamon][repo]

![Screenshot][screenshot]

## Installation
### From source
Run `./install.sh` or move the `Railway` folder into your `~/.themes` folder.

### Cinnamon Spices
Download it from [here][spices] or search for "Railway" in your Cinnamon theme settings.

---
## Developing
Run `./utils.sh --watch` to automatically compile and reload the theme. It will create a link in `~/.themes`.

### Contributing
Contributions are accepted via GitHub pull requests [here][repo]. Please, if you modify any image resource, run `./utils.sh --simplify` before creating a commit.

**NOTE**: never edit CSS files directly. They are overriden at build.

### Dependencies
* `inotifywait (inotify-tools)`: watch for changes
* `sassc`: compile sass files
* `scour`: remove svg metadata

## Credits
Special thanks to [@zagortenay333](https://github.com/zagortenay333) for the codebase.

[repo]: https://github.com/germanfr/railway-cinnamon
[spices]: https://cinnamon-spices.linuxmint.com/themes/view/Railway
[screenshot]: https://cinnamon-spices.linuxmint.com/git/themes/Railway/screenshot2.png
