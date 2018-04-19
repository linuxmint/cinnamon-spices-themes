# [Adara Cinnamon theme][repo]
> Just a neutral theme

[![](screenshot.png)][repo]

## Installation
#### From source
Run `make install` or move the `Adara` folder into your `~/.themes` folder.

#### Cinnamon Spices
Download it from [here][spices] or search for "Adara" in your Cinnamon theme settings.

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

## License
```
Adara theme for Cinnamon
Copyright (C) 2018 Germán Franco <dev.germanfr@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
```

[repo]: https://github.com/germanfr/adara-theme
[spices]: https://cinnamon-spices.linuxmint.com/themes/view/Adara
[archive]: https://github.com/germanfr/adara-theme/releases
