var App = App || {};
App.classes = App.classes || {};

// Loading class, shows the loading view (a loading spinner image) while views are being switched.
App.classes.LoadingView = Backbone.View.extend({
	el: '#content',
	template: App.templates.loading,
	initialize: function(data) {
		'use strict';
		this.$el.html(this.template(data));
	}
});