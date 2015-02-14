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

      gameData.locations = data
      scrnUtil.showData(data)

    });
  });

  $("#user-input").submit(function(event) {
    event.preventDefault();
    userInput = $("#user-input").serializeArray();
    testData = userInput[2].value
    document.getElementById("user-input").reset();

    gameData.direction = testData

    $(".text-field").append( "<span id=" + count + ">" + userInput[2].value + "<br></span>");
    $( "#" + count ).fadeOut( 3400 );
    count ++
    $.post( "/welcome", userInput, function(data) {
      setTimeout(function(){

        scrnUtil.showData(data)

      }, 900)
    });
  });


  var scrnUtil = {
    showData : function (data) {
      $(".text-field").append( "<span id=" + count + ">" + "You moved to: " + data.position + " room<br></span>");
      $( "#" + count ).fadeOut( 3400 );
      $( ".hidden" ).hide();
      $( "#" + data.position).show();
      count ++
    }
  }

  gameData = ""

});
