var App = App || {};
App.classes = App.classes || {};

App.classes.IndexView = App.classes.BaseView.extend({
    el: '#content',
    template: App.templates.index,
    // This is a totally static page, so lets render here, no need for a seperate render function.
    // Data will be empty but this is just an example :)
    initialize: function(data) {
        'use strict';
        this.render(data);
    }
});