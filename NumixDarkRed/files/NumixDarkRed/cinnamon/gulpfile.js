var gulp        = require('gulp'),
    plumber     = require('gulp-plumber'),
    notify      = require('gulp-notify'),
    gutil       = require('gulp-util'),
    beep        = require('beepbeep'),
    shell       = require('gulp-shell'),
    fs          = require('fs'),
    sass        = require('gulp-sass');


// Error handler
var onError = function (err) {
    var lineNumber = (err.line) ? 'Line ' + err.line : '';

    notify({
        title: 'Task Failed  [ ' + err.plugin + ' ]',
        message: lineNumber
    }).write(err);
    beep();
    gutil.log(gutil.colors.red(err));
    this.emit('end');
};


// Compile sass
gulp.task('sass', function () {
    return gulp.src('sass/cinnamon.scss')
        .pipe(plumber({ errorHandler: onError }))
        .pipe(sass({
            outputStyle: 'expanded'
        }))
        .pipe(gulp.dest('.'));
});


// Wait for sass to compile & reload theme
gulp.task('reloadTheme', ['sass'], shell.task([
    'gsettings set org.cinnamon.theme name default',
    'gsettings set org.cinnamon.theme name Numix-Cinnamon'
]));


// Make a symlink in the ~/.themes dir
gulp.task('install', function () {
    fs.mkdir(process.env.HOME+'/.themes/', function(){})
    fs.unlink(process.env.HOME+'/.themes/Numix-Cinnamon/', function(){})
    fs.symlink(__dirname+'/../../Numix-Cinnamon/', process.env.HOME+'/.themes/Numix-Cinnamon', function(){})
});


// Watch
gulp.task('watch', function () {
    gulp.watch(['sass/**/*'], ['reloadTheme']);
});


// Default task
gulp.task('default', ['install', 'reloadTheme', 'watch']);
