gulp         = require 'gulp'
slim         = require 'gulp-slim'
sass         = require 'gulp-sass'
coffee       = require 'gulp-coffee'
bourbon      = require('node-bourbon');

$        = require("gulp-load-plugins")(lazy: false)
# $logger  = $.util.log

gulp.task "styles::build::scss", ->
  gulp.src './src/scss/*.scss'
  .pipe sass
    includePaths: bourbon.includePaths
  .pipe gulp.dest('./dist/css')

gulp.task 'html::build::slim', ->
  gulp.src './src/slim/**/*.slim'
  .pipe slim pretty: true
  .pipe gulp.dest './dist/'

gulp.task "scripts::build::coffee", ->
  gulp.src("./src/coffee/**/*.coffee")
  .pipe(coffee({bare: true}))
  .pipe(gulp.dest("./dist/js"))

gulp.task "build::all", ['styles::build::scss', 'html::build::slim', 'scripts::build::coffee']

# watcher
gulp.task "watch", ['build::all'], ->
  gulp.watch "./src/scss/**/*.scss", ["styles::build::scss"]
  gulp.watch "./src/slim/**/*.slim", ["html::build::slim"]
  gulp.watch "./src/coffee/**/*.coffee", ["scripts::build::coffee"]
  return
