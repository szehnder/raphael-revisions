App.Collections.CssDocuments = Backbone.Collection.extend({
    model: JsDocument,
    url: '/css_documents',
    
    selectedItem: undefined,
    
    findByDocumentId: function(document_id) {
        return 1;
    }
    
    
});
