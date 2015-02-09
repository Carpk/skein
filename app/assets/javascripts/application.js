// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
  testData = 'not assigned'
  var count = 0

  $(".game-button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("fast")
    $.get( "/welcome/new", function(data) {
      testData = data
      $(".text-field").append( "<span id=" + count + ">" + data["position"] + "<br></span>");
      $( "#" + count ).fadeOut( 3400 );
      count ++
    })
  })

  $("#user-input").submit(function(event) {
    event.preventDefault();
    userData = $("#user-input").serializeArray();
    document.getElementById("user-input").reset();
    $(".text-field").append( "<span id=" + count + ">" + userData[2].value + "<br></span>");
    $( "#" + count ).fadeOut( 3400 );
    count ++
    $.post( "/welcome", userData, function(data) {
        setTimeout(function(){
          $(".text-field").append( "<span id=" + count + ">" + "You moved to: " + data.position + " room<br></span>");
            $( "#" + count ).fadeOut( 3400 );
            $( ".hidden" ).hide();
            $( "#" + data.position).show();
            count ++
        }, 900)
      });
  });

});
