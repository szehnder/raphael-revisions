var ZDocument = Backbone.Model.extend({
    NEW_DOCUMENT: "untitled document",
    
    // Ensure that each document created has a `title`.
    initialize: function() {
        this.doc = this.get('document');
       if(!this.doc.title) {
           this.doc.title = this.NEW_DOCUMENT;
       }
       this.selected = false;
     },
         
    url : function() {
      var base = 'documents';
      //if (this.isNew()) return base;
      return base + (base.charAt(base.length - 1) == '/' ? '' : '/') + this.doc.id;
    },
        
    clear: function() {
        this.destroy();
        this.view.remove();
    },
    
    toggleSelection: function() {
        this.selected = !this.selected;
    },
    
    isSelected: function() {
        return this.selected;
    }
});