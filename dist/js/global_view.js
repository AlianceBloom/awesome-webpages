var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.GlobalView = (function(_super) {
  __extends(GlobalView, _super);

  function GlobalView() {
    this.toggle_off_canvas = __bind(this.toggle_off_canvas, this);
    return GlobalView.__super__.constructor.apply(this, arguments);
  }

  GlobalView.prototype.el = $('body');

  GlobalView.prototype.events = {
    'click #open_button': 'toggle_off_canvas',
    'click #close_button': 'toggle_off_canvas',
    'click #content_wrap': 'toggle_off_canvas'
  };

  GlobalView.prototype.initialize = function() {};

  GlobalView.prototype.toggle_off_canvas = function(event) {
    var $target;
    $target = $(event.target).data('offcavnas-action') ? $(event.target) : $(event.target).parents('[data-offcavnas-action]');
    switch ($target.data('offcavnas-action')) {
      case 'open':
        $('#open_button').addClass('close').data('offcavnas-action', 'close');
        $(this.el).addClass('show-menu');
        break;
      case 'close':
        $('#open_button').removeClass('close').data('offcavnas-action', 'open');
        $(this.el).removeClass('show-menu');
    }
    return false;
  };

  return GlobalView;

})(Backbone.View);
