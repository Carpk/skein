class Player
  attr_reader :position, :rubies

  def initialize(params)
    @position = params[:location].to_sym
    @rubies = params[:rubies].to_i
  end

  def collect_ruby
    @rubies += 1
  end

  def sufficient_rubies?
    @rubies >= 5
  end

  def move(direction)
    @position = Map.next_room(@position, direction.to_sym)
  end

end
