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
        promptText(data.player.location);
        showMap(data.player.location);

        setGameState();
      }, 450)
    });
  }

  function gameOverText() {
    if (gameData.game.win) {
      $('#win-text').modal('show')
    } else {
      $('#lose-text').modal('show')
    }
  };

  $('#win-text').on('hidden.bs.modal', function () {
   location.reload();
  })

  $('#lose-text').on('hidden.bs.modal', function () {
   location.reload();
  })

  function addRuby() {
    $("#inventory").html("Rubies = " + gameData.player.rubies);
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
  };

  function fadeOutId() {
    $( "#" + idNum ).fadeOut( 3400 );
    idNum ++
  };

  function promptText(location) {
    $(".text-field").append( "<span id=" + idNum + ">" + "You moved to: " + location + " room<br></span>");
    fadeOutId();
  };

  function showMap(location) {
    $( ".rooms" ).addClass("hidden");
    console.info(location)
    $( "#" + location).removeClass("hidden");
  }

  function movementDirections() {
    $(".text-field").append( "<span id='directions' >To move, select <em>north</em>, <em>east</em>, <em>south</em>, or <em>west</em><br></span>");
    $( "#directions" ).fadeOut( 16200 );
  };

  $(".game-button").click(function(e) {
    e.preventDefault()

    $('#new-game').modal('hide')
    $.get( "/welcome/new", function(data) {

      gameData = data
      movementDirections();
      showMap(data.player.location);
      room = gameData.player.location.substring(0,3)
      $('#game-map').addClass(room);

      setRoomColor(room);
    });
  });




  $(".user-select").click(function(event) {
    event.preventDefault();
    userInput = event.target.innerText.toLowerCase()

    if (gameData.game.progress) {
      progressGame();
    }
  })


  // $("#user-input").submit(function(event) {
  //   event.preventDefault();
  //   rawInput = $("#user-input").serializeArray();
  //   userInput = rawInput[2].value
  //   document.getElementById("user-input").reset();

  //   if (gameData.game.progress) {
  //     progressGame();
  //   }
  // });

  $("#replay").click(function(event) {
    event.preventDefault();
    location.reload();
  })
});
