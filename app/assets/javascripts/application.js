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
  var idNum = 0
  var rubyCount = 0

  $(".game-button").click(function(e) {
    e.preventDefault()
    $(this).fadeOut("fast")
    $.get( "/welcome/new", function(data) {

      gameData = data
      scrnUtil.showData(data.player.location)
      room = gameData.player.location.substring(0,3)
      $('#game-map').addClass(room);

      setRoomColor(room);

    });
  });

  $("#user-input").submit(function(event) {
    event.preventDefault();
    rawInput = $("#user-input").serializeArray();
    userInput = rawInput[2].value
    document.getElementById("user-input").reset();

    if (gameData.game.progress) {
      progressGame();
    }
  });

  $("#replay").click(function(event) {
    event.preventDefault();
    location.reload();
  })

  function progressGame() {
    $(".text-field").append( "<span id=" + idNum + ">" + userInput + "<br></span>");
    fadeOutId();

    routesArray = gameData.game.routes

    if ($.inArray(userInput, routesArray) == -1) {
      invalidResponse();

    } else {
      gameData.game.routes = userInput

      sendData();
    };
  };

  function setGameState() {
    if (rubyCount != gameData.player.rubies) {
      addRuby();
    }

    if (gameData.game.progress == false) {
      gameOverText();
    };

    room = gameData.player.location.substring(0,3)
    setRoomColor(room);
  }

  function sendData() {
    $.post( "/welcome", gameData, function(data) {
      setTimeout(function() {
        gameData = data
        scrnUtil.showData(data.player.location);

        setGameState();

      }, 450)
    });
  }

  function gameOverText() {
    if (gameData.game.win) {
      $("#win-text").show();
    } else {
      $("#lose-text").show();
    }
  };

  function addRuby() {
    $("#ruby-field").html(gameData.player.rubies);
    $(".text-field").append( "<span id=" + idNum + ">You found a Ruby!<br></span>");
    fadeOutId();
    rubyCount ++
  };

  function invalidResponse() {
    $(".text-field").append( "<span id=" + idNum + ">Please choose a valid direction. (north, east, south, west)<br></span>");
    fadeOutId();
  };

  function setRoomColor(room) {
    $('#game-map').removeClass();
    $('#game-map').addClass(room);
    $('html').css({'background-image': 'url(assets/d-' + room + '.jpg)'});
  };

  function fadeOutId() {
    $( "#" + idNum ).fadeOut( 3400 );
    idNum ++
  };

  var scrnUtil = {
    showData : function (location) {
      $(".text-field").append( "<span id=" + idNum + ">" + "You moved to: " + location + " room<br></span>");
      fadeOutId();
      $( ".hidden" ).hide();
      $( "#" + location).show();
    }
  };

});
