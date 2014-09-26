var App = App || {};
App.classes = App.classes || {};

App.classes.BaseView = Backbone.View.extend({
    el: '#content',
    template: App.templates.index,
    initialize: function(data) {
        'use strict';
        this.render(data);
    },
    // Data will be empty but this is just an example :)
    render: function(data) {
        'use strict';
        this.$el.html(this.template(data));
    },
    // Open function is for changes you need to make outside of this view's element,
    // like changing the active element in your main navigation.
    open: function() {
        'use strict';
    },
    // Close stops this view listening for events.
    // You can also define custom code to be run using an onClose function rather than
    // overriding the whole function.
    close: function() {
        'use strict';
        this.closed = true;
        this.stopListening();
        this.off();
        this.undelegateEvents();
        if (this.onClose){
            this.onClose();
        }
    }
});