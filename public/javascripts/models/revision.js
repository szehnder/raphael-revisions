var Revision = Backbone.Model.extend({
    url : function() {
      var base = 'revisions';
      if (this.isNew()) return base;
      return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
    }
});