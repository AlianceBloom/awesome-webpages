window.page = {};

window.page.views = {};

$(function() {
  var global_route, global_view, _base;
  (_base = window.location).hash || (_base.hash = '#home');
  global_route = new GlobalRoute;
  global_view = new GlobalView;
  return Backbone.history.start();
});
