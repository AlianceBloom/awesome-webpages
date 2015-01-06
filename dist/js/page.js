window.page = {};

window.page.views = {};

$(function() {
  var global_route, global_view;
  window.location.hash = '#home';
  global_route = new GlobalRoute;
  global_view = new GlobalView;
  return Backbone.history.start();
});
