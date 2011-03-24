// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var App = {
   Views: {},
   Controllers: {},
   Collections: {},
   frontController: undefined,
   cssDocuments: undefined,
   jsDocuments: undefined,
   zDocuments: undefined,
   init: function() {
     this.frontController = new App.Controllers.ZDocuments();
     Backbone.history.start();
   }
};

String.prototype.count=function(s1) {   
    return (this.length - this.replace(new RegExp(s1,"g"), '').length) / s1.length;  
}