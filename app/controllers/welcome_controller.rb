class WelcomeController < ApplicationController

  def new
    data = Labyrinth.start_game

    render :json => data, :status => :ok
  end

  def create
    game = Labyrinth.new(params)
    data = game.take_turn

    render :json => data, :status => :ok
  end
end
