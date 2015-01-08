gulp         = require 'gulp'
slim         = require 'gulp-slim'
sass         = require 'gulp-sass'
coffee       = require 'gulp-coffee'

handlebars   = require 'gulp-handlebars'
wrap         = require 'gulp-wrap'
declare      = require 'gulp-declare'
concat       = require 'gulp-concat'


gutil        = require 'gulp-util'
bourbon      = require 'node-bourbon'

scss_included_paths = bourbon.includePaths.concat ['./src/scss/helpers']

gulp.task "styles::build::scss", ->
  gulp.src './src/scss/*.scss'
  .pipe sass
    includePaths: scss_included_paths
    "sourcemap=none": true
    onError: (error) ->
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
    gutil.log error
  .pipe gulp.dest "./dist/js"

gulp.task 'scripts::build::templates', ->
  gulp.src('./src/templates/*.slimbars')
    .pipe slim
      pretty: true
    .pipe handlebars()
    .pipe wrap 'Handlebars.template(<%= contents %>)'
    .pipe declare
      namespace: 'AwesomeWebpage.templates'
      noRedeclare: true
    .pipe concat 'templates.js'
    .pipe gulp.dest "./dist/js"

gulp.task "build::all", ['styles::build::scss', 'html::build::slim', 'scripts::build::coffee', 'scripts::build::templates']

# watcher
gulp.task "watch", ['build::all'], ->
  gulp.watch './src/scss/**/*.scss', ['styles::build::scss']
  gulp.watch './src/slim/**/*.slim', ['html::build::slim']
  gulp.watch './src/coffee/**/*.coffee', ['scripts::build::coffee']
  gulp.watch './src/templates/**/*.slimbars', ['scripts::build::templates']
  return
