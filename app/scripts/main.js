// App is our globally scoped variable that holds everything.
var App = App || {};

// Function for switching between views
// ViewClass is a reference to a view class to be instantiated.
// data is an object full of arguments to be passed to the view.
App.switchView = function(ViewClass, data) {
    'use strict';

    data = data || {};
    // Close the active view
    if (App.activeView && App.activeView.close) {
        App.activeView.close();
    }
    // Show the loading view.
    App.activeView = new App.classes.LoadingView();

    // If the ViewClass doesn't exist, put out a 404 view if it exists.
    if (!ViewClass && App.classes.NotfoundView) {
        ViewClass = App.classes.NotfoundView;
    }

    // instantiate ViewClass and set it as active.
    if (ViewClass) {
        App.activeView = new ViewClass(data);

        // also call its open function.
        if (App.activeView.open) {
            App.activeView.open();
        }
    }
};

// Routing, this is how we decide what to do depending on the URL.
// Most of the time we just switch the view. My defaultRouting function
// attempts to switch to a view that matches the page name in the URL.
var AppRouter = Backbone.Router.extend({
    routes: {
        '': 'defaultRouting',
        ':page(/)': 'defaultRouting'
    },
    defaultRouting: function(page) {
        'use strict';
        var viewName,
            // You need to implement argument passing yourself, as those arguments
            // will most likely come from the URL, and it's up to you how you
            // want to structure you URLs.
            data = {};

        // Format the page name to match the class naming convention.
        // If page is undefined then this is the index.
        viewName = page ? page.charAt(0).toUpperCase() + page.slice(1) : 'Index';

        App.switchView(App.classes[viewName+'View'], data);
    }
});

App.Router = new AppRouter();

Backbone.history.start();