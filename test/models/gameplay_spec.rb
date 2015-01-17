require_relative "../config"
require_relative "../lib/labyrinth/console"

describe "GamePlay" do

  let(:game) {GamePlay.new(Player.new(:violet, 0), Grue.new(:vermillion, 1), :emerald)}

  it "should return name of room you are in" do
    game.current_room.should eq("Violet Room")
  end

  it "should return name of room you are in" do
    game = GamePlay.new(Player.new(:cobalt, 0), Grue.new(:vermillion, 1), :emerald)
    game.current_room.should eq("Cobalt Room")
  end

  it "should return name of room you are in" do
    game = GamePlay.new(Player.new(:chartreuse, 0), Grue.new(:vermillion, 1), :emerald)
    game.current_room.should eq("Chartreuse Room")
  end

  it "should return name of the exit" do
    game.exit.should eq("Emerald Room")
  end

  it "should return name of the exit" do
    game = GamePlay.new(Player.new(:emerald, 0), Grue.new(:vermillion, 1), :cobalt)
    game.exit.should eq("Cobalt Room")
  end

  it "should return name of the exit" do
    game = GamePlay.new(Player.new(:cobalt, 0), Grue.new(:vermillion, 1), :chartreuse)
    game.exit.should eq("Chartreuse Room")
  end

  it "should return name of room to exit" do
    game.door_available?(:north).should eq(false)
  end

  it "should return name of room to exit" do
    game.door_available?(:east).should eq(true)
  end

  it "should return name of room to exit" do
    game.door_available?(:south).should eq(true)
  end

  it "should return name of room to exit" do
    game.door_available?(:west).should eq(true)
  end

  it "should move player to new room" do
    game.move_player(:east).should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    game.move_player(:south).should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    game.move_player(:west).should eq(:chartreuse)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game = GamePlay.new(Player.new(:ochre, 0), Grue.new(:vermillion, 1), :cobalt)
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know the number off rubies" do
    game.num_of_rubies.should eq(0)
  end

  it "should know the number off rubies" do
    game = GamePlay.new(Player.new(:ochre, 3), Grue.new(:vermillion, 1), :cobalt)
    game.num_of_rubies.should eq(3)
  end

  it "should issue player a ruby" do
    game.issue_ruby.should eq(1)
  end

  it "should know the number off rubies" do
    game = GamePlay.new(Player.new(:ochre, 6), Grue.new(:vermillion, 1), :cobalt)
    game.num_of_rubies.should eq(6)
  end

  it "should know grue is asleep" do
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is asleep" do
    game = GamePlay.new(Player.new(:ochre, 0), Grue.new(:vermillion, 5), :cobalt)
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is asleep" do
    game = GamePlay.new(Player.new(:ochre, 0), Grue.new(:vermillion, 7), :cobalt)
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is not asleep" do
    game = GamePlay.new(Player.new(:ochre, 0), Grue.new(:vermillion, 6), :cobalt)
    game.grue_asleep?.should eq(false)
  end

  it "should move closer to player" do
    game.grue_find_player.should eq(:aquamarine)
  end

  it "should move closer to player" do
    game = GamePlay.new(Player.new(:ochre, 0), Grue.new(:burnt_sienna, 6), :cobalt)
    game.grue_find_player.should eq(:lavender)
  end

  it "should know grue is not in same room as player" do
    game.grue_in_room?.should eq(false)
  end

  it "should know grue is in same room as player" do
    game = GamePlay.new(Player.new(:burnt_sienna, 0), Grue.new(:burnt_sienna, 6), :cobalt)
    game.grue_in_room?.should eq(true)
  end

  it "should add to grue's sleep counter" do
    game = GamePlay.new(Player.new(:burnt_sienna, 0), Grue.new(:burnt_sienna, 8), :cobalt)
    game.grue_sleeps.should eq(9)
  end

  it "should know when player has won" do
    game = GamePlay.new(Player.new(:cobalt, 4), Grue.new(:vermillion, 6), :cobalt)
    game.win?.should eq(false)
  end

  it "should know when player has won" do
    game = GamePlay.new(Player.new(:burnt_sienna, 5), Grue.new(:violet, 6), :cobalt)
    game.win?.should eq(false)
  end

  it "should know when player has won" do
    game = GamePlay.new(Player.new(:burnt_sienna, 5), Grue.new(:vermillion, 3), :burnt_sienna)
    game.win?.should eq(true)
  end

  it "should not be over when starting" do
    game.gameover?.should eq(false)
  end

  it "should not be over with short amount of rubies in the exit room" do
    game = GamePlay.new(Player.new(:lavender, 4), Grue.new(:burnt_sienna, 1), :lavender)
    game.gameover?.should eq(false)
  end

  it "should not be over with enough rubies but not in the exit room" do
    game = GamePlay.new(Player.new(:cobalt, 7), Grue.new(:burnt_sienna, 1), :vermillion)
    game.gameover?.should eq(false)
  end

  it "should be over when player and grue are in same room" do
    game = GamePlay.new(Player.new(:violet, 0), Grue.new(:violet, 1), :aquamarine)
    game.gameover?.should eq(true)
  end

  it "should be over when player has rubies and in exit" do
    game = GamePlay.new(Player.new(:violet, 5), Grue.new(:burnt_sienna, 1), :violet)
    game.gameover?.should eq(true)
  end
end
