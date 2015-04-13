require 'rails_helper'

describe "Player" do

  let(:player) { Player.new({location: :violet, rubies: 0}) }

  it "should return the player's correct positon" do
    player.position.should eq(:violet)
  end

  it "should return the player's correct positon" do
    player = Player.new({location: :burnt_sienna, rubies: 0})
    player.position.should eq(:burnt_sienna)
  end

  it "should return the player's correct positon" do
    player = Player.new({location: :emerald, rubies: 0})
    player.position.should eq(:emerald)
  end

  it "should return the player's correct positon" do
    player = Player.new({location: :aquamarine, rubies: 0})
    player.position.should eq(:aquamarine)
  end

  it "should return correct amount of rubies" do
    player.rubies.should eq(0)
  end

  it "should return correct amount of rubies" do
    player = Player.new({location: :burnt_sienna, rubies: 2})
    player.rubies.should eq(2)
  end

  it "should return correct amount of rubies" do
    player = Player.new({location: :emerald, rubies: 3})
    player.rubies.should eq(3)
  end

  it "should return correct amount of rubies" do
    player = Player.new({location: :aquamarine, rubies: 6})
    player.rubies.should eq(6)
  end

  it "should add a single ruby to the collection" do
    player.collect_ruby.should eq(1)
  end

  it "should add a single ruby to the collection" do
    player = Player.new({location: :burnt_sienna, rubies: 2})
    player.collect_ruby.should eq(3)
  end

  it "should add a single ruby to the collection" do
    player = Player.new({location: :burnt_sienna, rubies: 2})
    player.collect_ruby.should eq(3)
  end

  it "should add a single ruby to the collection" do
    player = Player.new({location: :burnt_sienna, rubies: 3})
    player.collect_ruby.should eq(4)
  end

  it "should return false if player has enough rubies" do
    player.sufficient_rubies?.should eq(false)
  end

  it "should return true if player has enough rubies" do
    player = Player.new({location: :burnt_sienna, rubies: 4})
    player.sufficient_rubies?.should eq(false)
  end

  it "should return true if player has enough rubies" do
    player = Player.new({location: :vermillion, rubies: 5})
    player.sufficient_rubies?.should eq(true)
  end

  it "should return true if player has enough rubies" do
    player = Player.new({location: :emerald, rubies: 7})
    player.sufficient_rubies?.should eq(true)
  end

  it "should move position in direction" do
    player.move(:south).should eq(:burnt_sienna)
  end

  it "should move position in direction" do
    player = Player.new({location: :ochre, rubies: 0})
    player.move(:north).should eq(:vermillion)
  end

  it "should move position in direction" do
    player = Player.new({location: :aquamarine, rubies: 0})
    player.move(:south).should eq(:violet)
  end

  it "should move position in direction" do
    player = Player.new({location: :chartreuse, rubies: 0})
    player.move(:north).should eq(:ochre)
  end

  it "should move position in direction" do
    player = Player.new({location: :emerald, rubies: 0})
    player.move(:east).should eq(:lavender)
  end

  it "should move position in direction" do
    player = Player.new({location: :lavender, rubies: 0})
    player.move(:west).should eq(:burnt_sienna)
  end
end
