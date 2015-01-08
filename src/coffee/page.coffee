window.page = {}
window.page.views = {}


$ ->
	window.location.hash = '#skills'
	global_route = new GlobalRoute
	global_view  = new GlobalView
	Backbone.history.start()