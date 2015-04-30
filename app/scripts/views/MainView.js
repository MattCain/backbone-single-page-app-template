(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.MainView = (function(superClass) {
    extend(MainView, superClass);

    function MainView() {
      return MainView.__super__.constructor.apply(this, arguments);
    }

    MainView.prototype.el = "#main";

    MainView.prototype.regions = {
      navigation: "#navigation",
      content: "#content"
    };

    MainView.prototype.initialize = function() {
      return this.getRegion("navigation").show(new App.NavigationView);
    };

    return MainView;

  })(Marionette.LayoutView);

}).call(this);
