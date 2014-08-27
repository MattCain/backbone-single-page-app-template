/*!
 * Copyright (c) 2014 Matt Cain (Twitter:@CainCode, Github:@MattCain)
 * Licensed under The MIT License.
 */

var App = App || {};
App.classes = App.classes || {};

App.classes.IndexView = Backbone.View.extend({
	el: '#content',
	template: App.templates.index,
	// This is a totally static page, so lets render here, no need for a seperate render function.
	// Data will be empty but this is just an example :)
	initialize: function(data) {
		'use strict';
		this.$el.html(this.template(data));
	}
});

// The about view is basically the same as the index view.
App.classes.AboutView = App.classes.IndexView.extend({
	template: App.templates.about
});