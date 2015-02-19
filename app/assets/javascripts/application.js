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
  var colors = [ "#E34234", "#CC7722", "#bdf030", "#50C878", "#7FFFD4", "#E6E6FA", "#0047AB", "#7F00FF", "#E97451"]
  var images = [ 'd1.jpg', 'd2.jpg', 'd3.jpg', 'd4.jpg', 'd5.jpg', 'd6.jpg', 'd7.jpg', 'd8.jpg', 'd9.jpg', 'd10.jpg', 'd11.jpg', 'd12.jpg', 'd13.jpg', 'd14.jpg', 'd15.jpg', 'd16.jpg', 'd17.jpg', 'd18.png', 'd19.jpg', 'd20.jpg'];
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
              $('#game-map').removeClass();
              $('#game-map').addClass(room);
              // $('.game-map').css({'color':  colors[Math.floor(Math.random() * colors.length)] });
              $('html').css({'background-image': 'url(assets/' + images[Math.floor(Math.random() * images.length)] + ')'});

            }, 450)
          });

        };
      }
    });

  $("#replay").click(function(event) {
    event.preventDefault();
    location.reload();
  })
  // json looks like: {player: {location: x, rubies: x}, grue: {location: x, sleep: x}, game: {routes: x, exit: x}}

  var scrnUtil = {
    showData : function (location) {
      $(".text-field").append( "<span id=" + count + ">" + "You moved to: " + location + " room<br></span>");
      $( "#" + count ).fadeOut( 3400 );
      $( ".hidden" ).hide();
      $( "#" + location).show();
      count ++
    }

  }


  // var images = ['d0.jpg', 'd1.jpg', 'd2.jpg', 'd3.jpg', 'd4.jpg', 'd5.jpg', 'd6.jpg'];
  // $('html').css({'background-image': 'url(assets/' + images[Math.floor(Math.random() * images.length)] + ')'});


});
