class WelcomeController < ApplicationController

  def new
    data = {position: "room", grue: "Hell"}
    render :json => data, :status => :ok
  end

  def create
    data = {position: "room", grue: "Hell"}
    # data = Labyrinth.take_turn(params[:board])
    render :json => data, :status => :ok
  end
end
