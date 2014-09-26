var App = App || {};
App.classes = App.classes || {};

// 404 view just shows a 404 message, doesn't need to extend base unless you
// want it to do more than that (unlikely)
App.classes.NotfoundView = Backbone.View.extend({
    el: '#content',
    template: App.templates.notfound,
    initialize: function(data) {
        'use strict';
        this.$el.html(this.template(data));
    }
});