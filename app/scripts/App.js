(function() {
  this.App = new Marionette.Application();

  App.addInitializer(function() {
    var ref;
    App.mainViewController = new App.MainViewController();
    App.router = new Marionette.AppRouter({
      controller: App.mainViewController,
      appRoutes: {
        "": "showIndexView",
        "about": "showAboutView",
        "contact": "showContactView"
      }
    });
    return (ref = Backbone.history) != null ? ref.start() : void 0;
  });

}).call(this);
