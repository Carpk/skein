class WelcomeController < ApplicationController

  def new
    data = {position: "first room", grue: "Hell"}
    render :json => data, :status => :ok
  end

  def create
    room = ["red", "blue", "green", "yellow", "orange"].sample
    data = {position: room, grue: "still in Hell"}
    # data = Labyrinth.take_turn(params[:board])
    render :json => data, :status => :ok
  end
end
