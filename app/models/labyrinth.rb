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
      game: {routes: routes, exit: exit, progress: true, win: false}
    }
  end

  def take_turn
    @game.move_player
    @game.grue_possible_flee
    @game.ruby_chance
    @game.grue_possible_move
    @game.check_rubies
    @game.grue_possible_win

    player_data = @game.hash_player_data
    grue_data = @game.hash_grue_data
    game_data = @game.hash_game_data

    { player: player_data, grue: grue_data, game: game_data }
  end


end
