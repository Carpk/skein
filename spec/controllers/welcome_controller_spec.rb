require 'rails_helper'

describe WelcomeController do

  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end

  it "new has 200 status" do
    get :new
    expect(response.status).to eq(200)
  end

  it "create has 200 status" do

    json = {format: 'json',
            "player"=>{"location"=>"emerald", "rubies"=>"0"},
            "grue"=>{"location"=>"vermillion", "sleep"=>"0"},
            "game"=>{"routes"=>"east", "exit"=>"aquamarine", "progress"=>"true", "win"=>"false"}
           }
    get :create, json
    expect(response.status).to eq(200)
  end

end