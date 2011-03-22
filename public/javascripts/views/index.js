App.Views.Index = Backbone.View.extend({
    initialize: function() {
          _.bindAll(this, 'addOne', 'addAll', 'render');
          this.documents = this.options.documents;
          this.jsDocuments = this.options.jsDocuments;
          this.cssDocuments = this.options.cssDocuments;
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
                $('#saveDocumentButton').bind('click', this.handleSaveDocumentButtonClick);
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
          var my_li = view.render().el;
          $(my_li).bind("selected", this.handleItemSelectionChange);
          //$(my_li).bind("deselected", this.handleItemSelectionChange);
          $("#documentList").append(my_li);
        },

        // Add all items in the **Todos** collection at once.
        addAll: function() {
          this.documents.each(this.addOne);
        },
        
        handleSelectionChanged: function(event, ui) {
            console.log("selection changed!");
            //debugger;
        },
        
        handleItemSelectionChange: function(event, document_id) {
              
            var doc = App.zDocuments.findById(document_id);
            //var jsdoc = App.jsDocuments.findByDocumentId(document_id);
            //var cssdoc = App.cssDocuments.findByDocumentId(document_id);
            App.zDocuments.selectedItem = doc;
            $('#liveDocument').attr('src', doc.path);
            jsEditor.setCode(doc.js_document.data);
            cssEditor.setCode(doc.css_document.data);
        },
        
        handleSaveDocumentButtonClick: function(event) {
            App.zDocuments.selectedItem.js_document.data = jsEditor.getCode();
            App.zDocuments.selectedItem.css_document.data = cssEditor.getCode();
            var jsDoc = new JsDocument({id: App.zDocuments.selectedItem.js_document.id, js_document: {data: jsEditor.getCode()}});
            jsDoc.save();
        }
    
    
   
});
