App.Views.Index = Backbone.View.extend({
    initialize: function() {
          _.bindAll(this, 'addOne', 'addAll', 'render');
          this.documents = this.options.documents;
          this.input    = this.$(".new-document");

        // App.Collections.ZDocuments.bind('add',     this.addOne);
        // App.Collections.ZDocuments.bind('refresh', this.addAll);
        // App.Collections.ZDocuments.bind('all',     this.render);

          $('.new-document').bind("click", this.doAddDocument);
          //$('.refresh-').bind("click", this.doRefresh);
        
        // App.Collections.ZDocuments.fetch();
        this.render();
      },
      
      el: $('#mainContainer'),

        events: {
        },
        
     render: function() {
         this.addAll();
                         // var stuff;
                         //                       this.documents.each(function(item) {
                         //                          console.log(item);
                         //                          stuff = ich.zDocumentTemplate(item.toJSON().document); 
                         //                          $('#documentList').append(stuff);
                         //                       });
                $('#documentList').selectable();
                $('#documentList').bind('selectablestop', this.handleSelectionChanged);
                return this;
        },

    handleTitleClick: function() {
        console.log("you just clicked the document: unknown");
    },
    
    doAddDocument: function() {
      console.log('doAddDocument()!');  
    },
    
    doRefresh: function() {
        console.log('doRefresh()!');
    },
    
    // Add a single todo item to the list by creating a view for it, and
        // appending its element to the `<ul>`.
        addOne: function(zdocument) {
          var view = new App.Views.ZDocumentView({model: zdocument});
          $("#documentList").append(view.render().el);
        },

        // Add all items in the **Todos** collection at once.
        addAll: function() {
          this.documents.each(this.addOne);
        },
        
        handleSelectionChanged: function(event, ui) {
            console.log("selection changed!");
            debugger;
        }
    
    
   
});
