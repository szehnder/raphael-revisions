App.Collections.JsDocuments = Backbone.Collection.extend({
    model: JsDocument,
    url: '/js_documents',
    
    selectedItem: undefined,
    
    findByDocumentId: function(document_id) {
        debugger;
        return 1;
    }
    
    
});
