(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.LoadingView = (function(superClass) {
    extend(LoadingView, superClass);

    function LoadingView() {
      return LoadingView.__super__.constructor.apply(this, arguments);
    }

    LoadingView.prototype.template = App.templates.LoadingView;

    return LoadingView;

  })(Marionette.ItemView);

}).call(this);
