class window.GlobalView extends Backbone.View
  el: $ 'body'

  events:
	  'click #open_button':  'toggle_off_canvas'
	  'click #close_button': 'toggle_off_canvas'
	  'click #content_wrap': 'toggle_off_canvas'


  initialize: () ->

  toggle_off_canvas: (event) =>
  	target = $ event.target
  	console.log target
  	switch target.data('offcavnas-action')
  		when 'open'
  			$(@el).addClass('show-menu')
  		when 'close'
  			$(@el).removeClass('show-menu')


  	return false
