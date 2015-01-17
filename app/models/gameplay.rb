class GamePlay

  def initialize(player, grue, exit)
    @player = player
    @exit = exit
    @grue = grue
  end

  def current_room
    @player.room_name
  end

  def exit
    Map.name_of_room(@exit)
  end

  def door_available?(direction)
    @player.door_available?(direction)
  end

  def move_player(direction)
    @player.move(direction)
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
