(function() {
  var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  App.ContactView = (function(superClass) {
    extend(ContactView, superClass);

    function ContactView() {
      return ContactView.__super__.constructor.apply(this, arguments);
    }

    ContactView.prototype.template = App.templates.ContactView;

    return ContactView;

  })(Marionette.ItemView);

}).call(this);
