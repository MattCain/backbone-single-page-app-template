var App = App || {};
App.classes = App.classes || {};

App.classes.IndexView = App.classes.BaseView.extend({
    el: '#content',
    template: App.templates.index
});