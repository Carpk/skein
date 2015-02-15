class Labyrinth

  def initialize(params)
    player = Player.new(params[:player])
    grue = Grue.new(params[:grue])
    direct = params[:game]
    @game = GamePlay.new(player, grue, direct)
  end

  def self.start_game
    position = Map.random_room
    exit = Map.random_room
    spawn = Map.spawn_away_from(position)
    routes = Map.possible_routes(position)
    { player: {location: position, rubies: 0},
      grue: {location: spawn, sleep: 0},
      game: {routes: routes, exit: exit}
    }
  end

  def take_turn
    @game.move_player
    player_location = @game.current_room
    rubies = @game.num_of_rubies
    grue_location = @game.grue_location
    grue_sleep = @game.grue_sleep_count
    routes = Map.possible_routes(player_location)
    exit = @game.exit_room

    {player: {location: player_location, rubies: rubies},
     grue: {location: grue_location, sleep: grue_sleep},
     game: {routes: routes, exit: exit}
    }
  end


end
