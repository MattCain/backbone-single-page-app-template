(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.AboutView = (function(superClass) {
    extend(AboutView, superClass);

    function AboutView() {
      return AboutView.__super__.constructor.apply(this, arguments);
    }

    AboutView.prototype.template = App.templates.AboutView;

    return AboutView;

  })(Marionette.ItemView);

}).call(this);
