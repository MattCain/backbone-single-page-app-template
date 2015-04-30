@App = new Marionette.Application()

# Start history when our application is ready
App.addInitializer( ->
    App.mainViewController = new App.MainViewController()

    App.router = new Marionette.AppRouter(
        controller: App.mainViewController
        appRoutes:
            "": "showIndexView"
            "about": "showAboutView"
            "contact": "showContactView"
    )

    Backbone.history?.start()
)