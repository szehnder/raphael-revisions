var CssDocument = Backbone.Model.extend({
    
    initialize: function() {
        this.doc = this.get('css_document');
    },
    url : function() {
      var base = 'css_documents';
      if (this.isNew()) return base;
      return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
    }
});