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
  var gameData = {}
  var count = 0
  rubyCount = 0

  $(".game-button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("fast")
    $.get( "/welcome/new", function(data) {

      gameData = data
      scrnUtil.showData(data.player.location)
      room = gameData.player.location.substring(0,3)
      $('#game-map').addClass(room);

      setRoomColor(room)

    });
  });

  // json: {player: {location: x, rubies: x}, grue: {location: x, sleep: x}, game: {routes: x, exit: x}}

    $("#user-input").submit(function(event) {
      event.preventDefault();
      rawInput = $("#user-input").serializeArray();
      userInput = rawInput[2].value
      document.getElementById("user-input").reset();

      if (gameData.game.progress) {

        $(".text-field").append( "<span id=" + count + ">" + userInput + "<br></span>");
        $( "#" + count ).fadeOut( 3400 );
        count ++

        routesArray = gameData.game.routes

        if ($.inArray(userInput, routesArray) == -1) {
          $(".text-field").append( "<span id=" + count + ">Please choose a valid direction. (north, east, south, west)<br></span>");
          $( "#" + count ).fadeOut( 3400 );
          count ++

        } else {
          gameData.game.routes = userInput

          $.post( "/welcome", gameData, function(data) {
            setTimeout(function(){
              gameData = data
              scrnUtil.showData(data.player.location);

              if (rubyCount != gameData.player.rubies) {
                $("#ruby-field").html(gameData.player.rubies);
                $(".text-field").append( "<span id=" + count + ">You found a Ruby!<br></span>");
                $( "#" + count ).fadeOut( 3400 );
                rubyCount ++
                count ++
              }

              if (gameData.game.progress == false) {
                if (gameData.game.win) {
                  $("#win-text").show();
                } else {
                  $("#lose-text").show();
                };
              };

              room = gameData.player.location.substring(0,3)
              setRoomColor(room)

            }, 450)
          });
        };
      }
    });

  $("#replay").click(function(event) {
    event.preventDefault();
    location.reload();
  })

  function setRoomColor(room) {
    $('#game-map').removeClass();
    $('#game-map').addClass(room);
    $('html').css({'background-image': 'url(assets/d-' + room + '.jpg)'});
  }

  var scrnUtil = {
    showData : function (location) {
      $(".text-field").append( "<span id=" + count + ">" + "You moved to: " + location + " room<br></span>");
      $( "#" + count ).fadeOut( 3400 );
      $( ".hidden" ).hide();
      $( "#" + location).show();
      count ++
    }

  }


});
