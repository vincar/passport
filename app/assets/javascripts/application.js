// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require modernizr.min
//= require css3-mediaqueries
//= require jquery.placeholder
//= require turbolinks
//= require i18n
//= require underscore-min
//= require_tree .

var load = function(){
  $('input, textarea').placeholder();
  $('input[autofocus]').focus();
  body = $('body')
  controller = body.data('controller')
  action = body.data('action')
  skip = body.data('skip-init')
  if(typeof skip == 'undefined') {
    new window[controller]()[action+"_init"]();
  }
}

$(document).ready(load);
$(document).on("page:load", load);
