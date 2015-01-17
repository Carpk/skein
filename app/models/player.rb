class Player
  attr_reader :position, :rubies

  def initialize(position,rubies)
    @position = position
    @rubies = rubies
  end

  def collect_ruby
    @rubies += 1
  end

  def sufficient_rubies?
    @rubies >= 5
  end

  def door_available?(direction)
    Map.door_available?(@position, direction)
  end

  def move(direction)
    @position = Map.next_room(@position, direction)
  end

  def room_name
    Map.name_of_room(@position)
  end
end