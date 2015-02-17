class GamePlay

  def initialize(player, grue, direction)
    @player = player
    @grue = grue
    @direction = direction
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
    direction = @direction[:routes]
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
    exit = @direction[:exit]
    {routes: routes, exit: exit}
  end

  def win_ruby?
    rand(0..5) == 4
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
