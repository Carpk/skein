class Player
  attr_reader :position, :rubies

  def initialize(params)
    @position = params[:location]
    @rubies = params[:rubies]
  end

  def collect_ruby
    @rubies += 1
  end

  def sufficient_rubies?
    @rubies >= 5
  end

  def move(direction)
    @position = Map.next_room(@position.to_sym, direction.to_sym)
  end

  # def room_name
  #   @position
  # end
end