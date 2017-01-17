###New-Minty for cinnamon

---

####Installation

Move the `New-Minty` folder into your `~/.themes` directory.

---

####Compatibility

The latest version of this theme is on the master branch, and it supports cinnamon version `3.2`.

For older versions, check the available [releases](../../releases).

---

####Development

This theme is written using the css preprocessor [sass](http://sass-lang.com/).

You should use the provided `gulpfile.js` for improved workflow and speed!

---

__In order to use gulp:__

* Install [nodejs](https://nodejs.org/) and [npm](https://www.npmjs.com/).
    * If you want to contribute, make sure you run the nodejs version from the `.nvmrc` file! Use [Nvm!](https://github.com/creationix/nvm)

* Install [gulp](http://gulpjs.com/) globally:
    ```sh
    $ npm install --global gulp
    ```

* In the directory where the `gulpfile.js` file is, run:
    ```sh
    $ npm install
    ```

* In the same dir, run the following to use gulp:
    ```sh
    $ gulp
    ```

---

__Gulp will:__

* __Make a symlink of the__ `New-Minty` __folder inside the__ `~/.themes` __dir.__

    * It will create a `~/.themes` dir if it doesn't exist already.

    * Even if you change the location of your working directory, running `gulp` will update the link.

    * If you already have a folder/file named `New-Minty` in your `.themes` dir, it will be __deleted__.

* __Compile sass__ whenever certain files change.
    * Open `gulpfile.js` to see what files/folders are being watched.

* __Autoreload the theme.__
    * Under cinnamon, this will only work for changes in the (s)css files. When modifying images, you will have to restart cinnamon.
