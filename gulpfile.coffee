gulp         = require 'gulp'
slim         = require 'gulp-slim'
sass         = require 'gulp-sass'
bourbon      = require('node-bourbon');
gulp.task "styles::build::scss", ->
  gulp.src './src/scss/*.scss'
  .pipe sass
    includePaths: bourbon.includePaths
  .pipe gulp.dest('./dist/css')

gulp.task 'html::build::slim', ->
  gulp.src './src/slim/**/*.slim'
  .pipe slim pretty: true
  .pipe gulp.dest './dist/'

gulp.task "build::all", ['styles::build::scss', 'html::build::slim']

# watcher
gulp.task "watch", ['build::all'], ->
  gulp.watch "./src/scss/**/*.scss", ["styles::build::scss"]
  gulp.watch "./src/slim/**/*.slim", ["html::build::slim"]
  return
