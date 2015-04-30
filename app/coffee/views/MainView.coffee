class App.MainView extends Marionette.LayoutView

    el: "#main"

    regions:
        navigation: "#navigation"
        content: "#content"

    initialize: ->
        @getRegion("navigation").show(new App.NavigationView)
