var gulp        = require("gulp"),
    plumber     = require("gulp-plumber"),
    notify      = require("gulp-notify"),
    gutil       = require("gulp-util"),
    beep        = require("beepbeep"),
    shell       = require("gulp-shell"),
    fs          = require("fs"),
    rimraf      = require("rimraf"),
    sass        = require("gulp-sass");


var themesDir   = process.env.HOME+"/.themes/",
    theme       = "Numix-Cinnamon-Transparent";


// Error handler
var onError = function (err) {
    var errorLine   = (err.line) ? "Line " + err.line : "",
        errorTitle  = (err.plugin) ? "Error in plugin: [ " + err.plugin + " ]" : "Error";

    notify.logLevel(0);
    notify({
            title: errorTitle,
            message: errorLine
    }).write(err);

    beep();

    gutil.log(gutil.colors.red("\n"+errorTitle+"\n\n", err.message));

    this.emit("end");
};


// Compile sass
gulp.task("sass", function () {
    return gulp.src("sass/cinnamon.scss")
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sass({ outputStyle: "expanded" }))
        .pipe(gulp.dest("."));
});


// Wait for sass to compile & reload theme
gulp.task("reloadTheme", ["sass"], shell.task([
    "gsettings set org.cinnamon.theme name default",
    "gsettings set org.cinnamon.theme name "+theme
]));


// Make a symlink in the ~/.themes dir
gulp.task("install", function () {

    // Ensure that ".themes" dir exists
    try {
        fs.mkdirSync(themesDir);
    } catch (err) {
        if (err.code !== "EEXIST") throw err;
    }


    // Check whether the theme dir/file exists in ".themes"
    // If it does exist, remove it
    try {
        if( fs.lstatSync(themesDir+theme).isDirectory() ||
            fs.lstatSync(themesDir+theme).isFile() ) {

            rimraf.sync(themesDir+theme);
        }
    } catch (err) {
        if (err.code !== "ENOENT") throw err;
    }


    // Create/update the link
    try {
        fs.unlinkSync(themesDir+theme);
    } catch (err) {
        if (err.code !== "ENOENT") throw err;
    }

    fs.symlinkSync(__dirname+"/../../"+theme, themesDir+theme);
});


// Watch
gulp.task("watch", function () {
    gulp.watch(["sass/**/*"], ["reloadTheme"]);
});


// Default task
gulp.task("default", ["install", "watch"], function() {
    gulp.start("reloadTheme");
});
