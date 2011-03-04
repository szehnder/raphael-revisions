//copyright 2010-2011 Sean Zehnder
/* this is the standard raphael_nodebox javascript include*/
var paper = undefined;

$(document).ready(function() {    
	var paper_width = $('#canvas').width;
	var paper_height = $('#canvas').height;
    
    paper = Raphael("canvas", paper_width, paper_height);
    draw();
    
});

$(window).resize(function() {
    var c = $('#canvas');
   paper.setSize(c.width(), c.height());
   draw(); 
});