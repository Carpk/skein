class GamePlay

  def initialize(player, grue, game_data)
    @player = player
    @grue = grue
    @directions_hash = game_data
  end

  def current_room
    @player.position
  end

  def hash_player_data
    @player.to_h
  end

  def move_player
    direction = @directions_hash[:routes]
    @player.move(direction)
  end

  def hash_grue_data
    @grue.to_h
  end

  def hash_game_data
    routes = Map.possible_routes(current_room)
    exit = @directions_hash[:exit]
    progress =  @directions_hash[:progress]
    win =  @directions_hash[:win]

    {routes: routes, exit: exit, progress: progress, win: win }
  end

  def win_ruby?
    chance = GameSettings::RubyWinChance
    rand(2..chance) == 3
  end

  def issue_ruby
    @player.collect_ruby
  end

  def win_ruby_chance
    if win_ruby?
      issue_ruby
    end
  end

  def grue_possible_move
    @grue.sleep_turn
    if @grue.awake?
      @grue.move_to(current_room)
    end
  end

  def end_game
    @directions_hash[:progress] = false
  end

  def check_rubies
    if @player.sufficient_rubies?
      @directions_hash[:win] = true
      end_game
    end
  end

  def grue_in_room?
    @grue.found_player?(@player.position)
  end

  def grue_flee_room
    @grue.flee_room
  end

  def grue_flee_possibility
    if grue_in_room?
      grue_flee_room
    end
  end

  def grue_possible_win
    if grue_in_room?
      @directions_hash[:win] = false
      end_game
    end
  end

  def sufficient_rubies?
    @player.sufficient_rubies?
  end

  def grue_asleep?
    @grue.asleep?
  end

  def grue_find_player
    @grue.move_to(@player.position)
  end

  def grue_sleeps
    @grue.sleep_turn
  end

  def win?
    @player.position ==  @directions_hash[:exit] && @player.sufficient_rubies?
  end

  def gameover?
    grue_in_room? || win?
  end
end
