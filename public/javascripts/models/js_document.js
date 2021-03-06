var JsDocument = Backbone.Model.extend({
    
    initialize: function() {
        this.doc = this.get('js_document');
    },
    url : function() {
      var base = 'js_documents';
      if (this.isNew()) return base;
      return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.id;
    }
});