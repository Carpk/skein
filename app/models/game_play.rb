class GamePlay

  def initialize(player, grue, direction)
    @player = player
    @grue = grue
    @direction = direction
  end

  def current_room
    @player.position
  end

  def move_player
    direction = @direction[:routes]
    @player.move(direction)
  end

  def exit_room
    @direction[:exit]
  end

  def grue_location
    @grue.position
  end

  def grue_sleep_count
    @grue.sleep_count
  end




  def sufficient_rubies?
    @player.sufficient_rubies?
  end

  def num_of_rubies
    @player.rubies
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
