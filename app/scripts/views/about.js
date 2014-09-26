var App = App || {};
App.classes = App.classes || {};

// The about view is basically the same as the index view, the template is the only difference.
App.classes.AboutView = App.classes.IndexView.extend({
    template: App.templates.about
});