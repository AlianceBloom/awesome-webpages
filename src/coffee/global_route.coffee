class window.GlobalRoute extends Backbone.Router

  routes:
    '':          'index'
    'home':      'index'
    'portfolio': 'portfolio'

  initialize: ->
    @navigate 'home', trigger: true

  index: () ->

  portfolio: () ->

