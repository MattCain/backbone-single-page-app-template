class App.MainViewController extends Marionette.Object

    initialize: ->
        App.vent.on("ChangeView", (viewName, data) -> showView(viewName, data))

        @mainView = new App.MainView()

    showView: (viewName, data = {}) ->
        # Show the loading view first, so we'll a loading spinner if
        # the new view has a delay in rendering
        @mainView.getRegion("content").show(new App.LoadingView)

        view = App[viewName]
        if view?
            @mainView.getRegion("content").show(new App[viewName](data))
        else
            @mainView.getRegion("content").show(new App.NotFoundView)

    showIndexView: ->
        @showView("IndexView")

    showAboutView: ->
        @showView("AboutView")

    showContactView: ->
        @showView("ContactView")