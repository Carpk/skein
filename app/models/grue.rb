class Grue
  attr_reader :position, :sleep_count

  def initialize(params)
    @position = params[:location]
    @sleep_count = params[:sleep]
  end

  def asleep?
    puts @position
    @sleep_count % 6 != 0
  end

  def sleep_turn
    @sleep_count += 1
  end

  def move_to(player)
    @position = Compass.move_to_target(@position, player)
  end

  def found_player?(player)
    @position == player
  end

  def flee_room
    next_direction = Map.cardinal_exits(@position).sample
    @position = Map.next_room(@position, next_direction)
  end
end
