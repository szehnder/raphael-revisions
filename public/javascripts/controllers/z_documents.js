App.Controllers.ZDocuments = Backbone.Controller.extend({
    routes: {
        "documents/:id":            "edit",
        "":                         "index",
        "new":                      "newDoc"
    },
    
    edit: function(id) {
        var doc = new ZDocument({ id: id });
            doc.fetch({
                success: function(model, resp) {
                    new App.Views.Edit({ model: doc });
                },
                error: function() {
                    new Error({ message: 'Could not find that document.' });
                    window.location.hash = '#';
                }
            });
    },
    
    index: function() {
        console.log("[Controller] index()");
        App.zDocuments = new App.Collections.ZDocuments();
        App.jsDocuments = new App.Collections.JsDocuments();
        App.cssDocuments = new App.Collections.CssDocuments();
        App.jsDocuments.fetch();
        App.cssDocuments.fetch();
        App.zDocuments.fetch({
                success: function() {
                                           new App.Views.Index({ documents: App.zDocuments, jsDocuments: App.jsDocuments, cssDocuments: App.cssDocuments});
                                       },
                                       error: function() {
                                           new Error({ message: "Error loading documents." });
                                       }
                       });
         
    },
    
    newDoc: function() {
        new App.Views.Edit({ model: new ZDocument() });
    }
});
