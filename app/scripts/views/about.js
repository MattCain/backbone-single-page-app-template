/*!
 * Copyright (c) 2014 Matt Cain (Twitter:@CainCode, Github:@MattCain)
 * Licensed under The MIT License.
 */

var App = App || {};
App.classes = App.classes || {};

// The about view is basically the same as the index view, the template is the only difference.
App.classes.AboutView = App.classes.IndexView.extend({
	template: App.templates.about
});