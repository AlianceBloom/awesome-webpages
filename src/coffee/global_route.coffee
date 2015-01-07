class window.GlobalRoute extends Backbone.Router

  routes:
    '':          'index'
    'home':      'index'
    'portfolio': 'portfolio'

  initialize: ->
    @navigate 'home', trigger: true

  index: () ->
    $('#content').html AwesomeWebpage.templates.home()

  portfolio: () ->
    $('#content').html AwesomeWebpage.templates.portfolio()

