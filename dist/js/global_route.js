var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.GlobalRoute = (function(_super) {
  __extends(GlobalRoute, _super);

  function GlobalRoute() {
    return GlobalRoute.__super__.constructor.apply(this, arguments);
  }

  GlobalRoute.prototype.routes = {
    '': 'index',
    'home': 'index',
    'portfolio': 'portfolio'
  };

  GlobalRoute.prototype.initialize = function() {
    return this.navigate('portfolio', {
      trigger: true
    });
  };

  GlobalRoute.prototype.index = function() {
    return $('#content').html(AwesomeWebpage.templates.home());
  };

  GlobalRoute.prototype.portfolio = function() {
    return $('#content').html(AwesomeWebpage.templates.portfolio());
  };

  return GlobalRoute;

})(Backbone.Router);
