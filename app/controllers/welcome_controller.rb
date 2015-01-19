class WelcomeController < ApplicationController

  def new
    data = {position: "first room", grue: "Hell"}
    render :json => data, :status => :ok
  end

  def create
    room = ["red room", "blue room", "green room", "yellow room", "orange room"].sample
    data = {position: room, grue: "still in Hell"}
    # data = Labyrinth.take_turn(params[:board])
    render :json => data, :status => :ok
  end
end
