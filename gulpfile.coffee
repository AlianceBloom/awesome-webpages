gulp         = require 'gulp'
slim         = require 'gulp-slim'
sass         = require 'gulp-sass'
coffee       = require 'gulp-coffee'
gutil        = require 'gulp-util'
bourbon      = require 'node-bourbon'
notify       = require 'gulp-notify'

scss_included_paths = bourbon.includePaths.concat ['./src/scss/helpers']

gulp.task "styles::build::scss", ->
  gulp.src './src/scss/*.scss'
  .pipe sass
    includePaths: scss_included_paths
    onError: (error) ->
      notify.onError "Error to build task:styles::build::scss \n Error: #{error}"
      gutil.log gutil.colors.red(error)
  .pipe gulp.dest('./dist/css')

gulp.task 'html::build::slim', ->
  gulp.src './src/slim/**/*.slim'
  .pipe slim pretty: true
  .pipe gulp.dest './dist/'

gulp.task "scripts::build::coffee", ->
  gulp.src("./src/coffee/**/*.coffee")
  .pipe coffee
    bare: true
  .on 'error', (error) ->
    notify.onError "Error to build scripts::build::coffee \n Error: #{error}"
    gutil.log error
  .pipe gulp.dest("./dist/js")

gulp.task "build::all", ['styles::build::scss', 'html::build::slim', 'scripts::build::coffee']

# watcher
gulp.task "watch", ['build::all'], ->
  gulp.watch "./src/scss/**/*.scss", ["styles::build::scss"]
  gulp.watch "./src/slim/**/*.slim", ["html::build::slim"]
  gulp.watch "./src/coffee/**/*.coffee", ["scripts::build::coffee"]
  return
