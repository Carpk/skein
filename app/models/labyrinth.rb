class Labyrinth

  # def initialize(position = Map.random_room, rubies = 0, spawn = Map.spawn_away_from(position), grue_sleep_count = 1, exit = Map.random_room)
  #   @game = GamePlay.new(Player.new(position, rubies), Grue.new(spawn, grue_sleep_count), exit).
  #   @view = DisplayUtility.new
  # end

  def self.start_game
    position = Map.random_room
    spawn = Map.spawn_away_from(position)
    routes = Map.possible_routes(position)
    {position: position, grue: spawn, routes: routes}
  end

  def self.take_turn(current_positions)
    position = current_positions[:player]
    grue = current_positions[:grue]
  end

  def play
    @view.instructions(@game.exit)
    until @game.gameover?
      if @game.grue_asleep?

        direction = valid_player_input
        move_player(direction)

        rubies_check
        check_room_for_grue
      else
        @view.rest
        sleep(2)
        @game.grue_find_player
      end
      @game.grue_sleeps
    end
    final_prompts
  end

  def valid_player_input
    direction = @view.choose_direction(@game.current_room).to_sym

    until @game.door_available?(direction)
      @view.no_door
      direction = @view.choose_direction(@game.current_room).to_sym
    end
    direction
  end

  def move_player(direction)
    @view.clear_screen
    @view.move_cursor_to_top

    @game.move_player(direction)
  end

  def rubies_check
    if @game.sufficient_rubies?
      @view.prompt_exit(@game.num_of_rubies, @game.exit)
    end
  end

  def check_room_for_grue
    if @game.grue_in_room?
      @game.grue_flee_room
      @game.issue_ruby
      @view.grue_flee(@game.num_of_rubies)
    end
  end

  def final_prompts
    if @game.win?
      @view.gameover_win
    elsif @game.grue_in_room?
      @view.gameover_lose
    end
  end
end
