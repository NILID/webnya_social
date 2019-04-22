// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require rails-ujs
//= require jquery-ui
//= require activestorage
//= require_tree .

$(function() {
   $('#flash').delay(500).fadeIn('normal', function() {
       $(this).delay(2500).fadeOut();
   });
   $( "#main .drag" ).draggable({ opacity: 0.35, handle: "h2", containment: "html", stack: "#main .drag" }).resizable({minHeight: 150, minWidth: 150});

   $('#changecolor').colorpicker();

});