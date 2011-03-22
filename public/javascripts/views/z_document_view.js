App.Views.ZDocumentView = Backbone.View.extend({
   initialize: function(args) {
       _.bindAll(this, 'render', 'close');
       this.model.bind('change', this.render);
       this.model.view = this;
   },
   
   tagName: "li",
   
   events: {
       'click': 'handleClick',
       //"dblclick div.document-title" : "edit",
       "click span.document-destroy"   : "clear"
       //"keypress .document-input"      : "updateOnEnter"
   },
   
   render: function() {
       $(this.el).html(ich.documentItemTemplate(this.model.toJSON().document));
       this.setTitle();
       return this;
   },
   
   setTitle: function() {
     var title = this.model.get('document').title;
     this.input = this.$('.document-input');
     this.input.bind('blur', this.close);
     this.input.val(title);  
   },
   // Switch this view into '"editing"' mode, displaying the input field.
   edit: function() {
     console.log("edit()");
     $(this.el).addClass("editing");  
     this.input.focus();
   },
   
   // Remove the item, destroy the model.
   clear: function() {
       this.model.clear();
   },
   
   // Remove this view from the DOM.
   remove: function() {
       $(this.el).remove();
   },
   
   // Close the `"editing"` mode, saving changes to the todo.
   close: function() {
       this.model.save({title: this.input.val()});
       $(this.el).removeClass("editing");
   },

   changeName: function() {
    //   this.$('.name').text(this.model.get('name'));
   },
   
   handleClick: function() {
       console.log("clicked item["+this.model.get('document').id+"]: "+this.model.get('document').title);
       $(this.el).trigger("selected", this.model.get('document').id);
       if (this.model.isSelected()) {
           //$(this.el).addClass("selected");
       } else {
           //$(this.el).removeClass("selected");
       }
   },
   
   handleSelectionStateChange: function (data, i) {
       this.model.selected = $(this.el).hasClass('ui-selected');
       if (this.model.selected==true) {
           $("#documentList").addClass("selection_id_"+this.model.get('document').id);           
       } else {
           $("#documentList").removeClass("selection_id_"+this.model.get('document').id);           
       }
       console.log(""+this.model.doc.title+" is now "+(this.model.isSelected())? 'selected' : 'unselected');
   }
});