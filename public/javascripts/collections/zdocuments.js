 App.Collections.ZDocuments = Backbone.Collection.extend({
     model: ZDocument,
     url: '/documents',
     
     //This is the JSON object for the currently selected document
     selectedItem: undefined,
     
     findById: function(document_id) {
         var targetDoc = undefined;
         var docs = this.toJSON();
         _.each(docs, function(d) {
             var doc = d.document;
             if (doc.id==document_id) {
                targetDoc = doc;
            }
         });
         return targetDoc;
     }
     
 });
