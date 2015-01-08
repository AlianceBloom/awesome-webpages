class window.GlobalRoute extends Backbone.Router

  routes:
    '':          'index'
    'home':      'index'
    'portfolio': 'portfolio'
    'skills':    'skills'

  initialize: ->
    @navigate 'portfolio', trigger: true

  index: () ->
    $('#content').html AwesomeWebpage.templates.home()

  portfolio: () ->
    $('#content').html AwesomeWebpage.templates.portfolio()

  skills: () ->
    $('#content').html AwesomeWebpage.templates.skills()
    setTimeout ->
      $.each $('li[data-procents]'), (index, element) ->
        $(element).find('div.bar').css
          width: $(element).data('procents')
    , 100

