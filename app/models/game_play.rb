class GamePlay

  def initialize(player, grue, game_data)
    @player = player
    @grue = grue
    @directions_hash = game_data
  end

  def current_room
    @player.position
  end

  def num_of_rubies
    @player.rubies
  end

  def hash_player_data
    player_location = current_room
    rubies = num_of_rubies
    {location: player_location, rubies: rubies}
  end

  def move_player
    direction = @directions_hash[:routes]
    @player.move(direction)
  end

  def grue_location
    @grue.position
  end

  def grue_sleep_count
    @grue.sleep_count
  end

  def hash_grue_data
    # grue_location = grue_location
    grue_sleep = grue_sleep_count
    {location: grue_location, sleep: grue_sleep}
  end

  def hash_game_data
    routes = Map.possible_routes(current_room)
    exit = @directions_hash[:exit]
    progress =  @directions_hash[:progress]
    win =  @directions_hash[:win]
    {routes: routes, exit: exit, progress: progress, win: win }
  end

  def win_ruby?
    rand(2..4) == 3
  end

  def ruby_chance
    if win_ruby?
      @player.collect_ruby
    end
  end

  def grue_possible_move
    @grue.sleep_turn
    if @grue.awake?
      @grue.move_to(current_room)
    end
  end

  def check_rubies
    if num_of_rubies > 2
      @directions_hash[:win] = true
      @directions_hash[:progress] = false
    end
  end



  def sufficient_rubies?
    @player.sufficient_rubies?
  end

  def issue_ruby
    @player.collect_ruby
  end

  def grue_asleep?
    @grue.asleep?
  end

  def grue_find_player
    @grue.move_to(@player.position)
  end

  def grue_in_room?
    @grue.found_player?(@player.position)
  end

  def grue_flee_room
    @grue.flee_room
  end

  def grue_sleeps
    @grue.sleep_turn
  end

  def win?
    @player.position == @exit && @player.sufficient_rubies?
  end

  def gameover?
    grue_in_room? || win?
  end
end
