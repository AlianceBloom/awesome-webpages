class window.GlobalView extends Backbone.View
  el: $ 'body'

  events:
    'click #open_button':  'toggle_off_canvas'
    'click #close_button': 'toggle_off_canvas'
    'click #content_wrap': 'toggle_off_canvas'

  initialize: () ->

  toggle_off_canvas: (event) =>
    $target = if $(event.target).data('offcavnas-action') then $(event.target) else $(event.target).parents('[data-offcavnas-action]')

    switch $target.data('offcavnas-action')
      when 'open'
        $('#open_button').addClass('close').data('offcavnas-action', 'close')
        $(@el).addClass('show-menu')
      when 'close'
        $('#open_button').removeClass('close').data('offcavnas-action', 'open')
        $(@el).removeClass('show-menu')

    return false;