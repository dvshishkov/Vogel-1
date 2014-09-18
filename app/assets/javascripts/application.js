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
//= require foundation
//= require turbolinks
//= require angular/angular
//= require angular-ui-router/release/angular-ui-router.min
//= require lodash/dist/lodash.min
//= require AngularJS-Toaster/toaster
//= require angular-animate/angular-animate.min
//= require angular-loading-bar/build/loading-bar
//= require_tree .

$(function(){ $(document).foundation(); });


$(document).on('page:load', function() {
   $('[ng-app]').each(function() {
     var module = $(this).attr('ng-app');
     angular.bootstrap(this, [module]);
   });
});