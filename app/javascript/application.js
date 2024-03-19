// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import 'bootstrap';

$(document).ready(function() {
    $("#show").click(function(){
       $("#box").show(1000);
    });
    $("#hide").click(function(){
       $("#box").hide(5000);
    });
 });

 $(document).ready(function(){
    $("h1").css("color","red");
 });