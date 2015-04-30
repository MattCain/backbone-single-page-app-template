(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.MainViewController = (function(superClass) {
    extend(MainViewController, superClass);

    function MainViewController() {
      return MainViewController.__super__.constructor.apply(this, arguments);
    }

    MainViewController.prototype.initialize = function() {
      App.vent.on("ChangeView", function(viewName, data) {
        return showView(viewName, data);
      });
      return this.mainView = new App.MainView();
    };

    MainViewController.prototype.showView = function(viewName, data) {
      var view;
      if (data == null) {
        data = {};
      }
      this.mainView.getRegion("content").show(new App.LoadingView);
      view = App[viewName];
      if (view != null) {
        return this.mainView.getRegion("content").show(new App[viewName](data));
      } else {
        return this.mainView.getRegion("content").show(new App.NotFoundView);
      }
    };

    MainViewController.prototype.showIndexView = function() {
      return this.showView("IndexView");
    };

    MainViewController.prototype.showAboutView = function() {
      return this.showView("AboutView");
    };

    MainViewController.prototype.showContactView = function() {
      return this.showView("ContactView");
    };

    return MainViewController;

  })(Marionette.Object);

}).call(this);
