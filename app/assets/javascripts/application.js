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
  count = 0

  $(".game-button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("fast")
    $.get( "/welcome/new", function(data) {
      testData = data
      $(".text-field").append(data["position"] + "<br>");
    })
  })


  $('#user-input').keypress(function(event){
    var keycode = (event.keyCode ? event.keyCode : event.which);
    if(keycode == '13'){
      userData = $("#user-input").serializeArray();
      // $("#user-input")[0].reset();
      // $("#user-input")[0].reset();
      $(".text-field").append( userData[0].value + "<br>");
      $.post( "/welcome", userData, function(data) {
        // document.getElementById("user-input").reset();
        setTimeout(function(){

          $(".text-field").append( "You moved to: " + data.position + "<br>");

        },800)

      })
    }
  });

  // $('.input-field').keydown(function(e) {
  // var key = e.which;
  // if (key == 13) {
  //   // count ++
  //     $(".text-field").append(count);
  //   }
  // });

  // $('#text_field_1').keypress(function(e) {
  // if (e.which == 13) {
  // alert('The enter key was pressed!');
  // }
  // });

})
