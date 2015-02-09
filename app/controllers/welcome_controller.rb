class WelcomeController < ApplicationController

  def new
    data = {position: "first room", grue: "Hell"}
    render :json => data, :status => :ok
  end

  def create
    room = ["aquamarine", "chartreuse", "cobalt", "emerald", "lavender", "ochre", "sienna", "vermillion", "violet"].sample
    data = {position: room, grue: "still in Hell"}
    # data = Labyrinth.take_turn(params[:board])
    render :json => data, :status => :ok
  end
end
