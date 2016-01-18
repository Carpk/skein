class Grue
  attr_reader :position, :sleep_count

  def initialize(params)
    @position = params[:location].to_sym
    @sleep_count = params[:sleep].to_i
  end

  def asleep?
    @sleep_count % GameSettings::GrueSleepCount != 0
  end

  def awake?
    @sleep_count % GameSettings::GrueSleepCount == 0
  end

  def sleep_turn
    @sleep_count += 1
  end

  def to_h
    {location: @position, sleep: @sleep_count}
  end

  def move_to(room)
    @position = Compass.move_to_target(@position, room)
  end

  def found_player?(room)
    @position == room
  end

  def flee_room
    next_direction = Map.cardinal_exits(@position).sample
    @position = Map.next_room(@position, next_direction)
  end
end
