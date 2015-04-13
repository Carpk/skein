require 'rails_helper'

describe "GamePlay" do

  let(:grue)   { Grue.new({location: :vermillion, sleep: 1}) }
  let(:player) { Player.new({location: :violet, rubies: 0}) }
  let(:game)   { GamePlay.new(player, grue, {routes: :east, exit: :emerald, progress: true, win: false}) }

  it "should return name of room you are in" do
    game.current_room.should eq(:violet)
  end

  it "should return name of room you are in" do
    player = Player.new({location: :cobalt, rubies: 0})
    direct = {routes: :east, exit: :emerald, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.current_room.should eq(:cobalt)
  end

  it "should return name of room you are in" do
    player = Player.new({location: :chartreuse, rubies: 0})
    game = GamePlay.new(player, grue, :emerald)
    game.current_room.should eq(:chartreuse)
  end

  it "should return name of the exit" do
    game.hash_game_data[:exit].should eq(:emerald)
  end

  it "should return name of the exit" do
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.hash_game_data[:exit].should eq(:cobalt)
  end

  it "should return name of the exit" do
    direct = {routes: :east, exit: :chartreuse, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.hash_game_data[:exit].should eq(:chartreuse)
  end

  it "should move player to new room" do
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game.move_player.should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    direct = {routes: :south, exit: :cobalt, progress: true, win: false}
    game.move_player.should eq(:burnt_sienna)
  end

  it "should move player to new room" do
    direct = {routes: :west, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.move_player.should eq(:chartreuse)
  end

  it "should know if player has enough rubies" do
    game.sufficient_rubies?.should eq(false)
  end

  it "should know if player has enough rubies" do
    player = Player.new({location: :ochre, rubies: 0})
    grue = Grue.new({location: :vermillion, sleep: 1})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
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
    player = Player.new({location: :ochre, rubies: 3})
    grue = Grue.new({location: :vermillion, sleep: 1})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.num_of_rubies.should eq(3)
  end

  it "should issue player a ruby" do
    game.issue_ruby.should eq(1)
  end

  it "should know the number off rubies" do
    player = Player.new({location: :ochre, rubies: 6})
    grue = Grue.new({location: :vermillion, sleep: 1})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.num_of_rubies.should eq(6)
  end

  it "should know grue is asleep" do
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is asleep" do
    player = Player.new({location: :ochre, rubies: 0})
    grue = Grue.new({location: :vermillion, sleep: 5})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is asleep" do
    player = Player.new({location: :ochre, rubies: 0})
    grue = Grue.new({location: :vermillion, sleep: 7})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_asleep?.should eq(true)
  end

  it "should know grue is not asleep" do
    player = Player.new({location: :ochre, rubies: 0})
    grue = Grue.new({location: :vermillion, sleep: 6})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_asleep?.should eq(false)
  end

  it "should move closer to player" do
    game.grue_find_player.should eq(:aquamarine)
  end

  it "should move closer to player" do
    player = Player.new({location: :ochre, rubies: 0})
    grue = Grue.new({location: :burnt_sienna, sleep: 6})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_find_player.should eq(:lavender)
  end

  it "should know grue is not in same room as player" do
    game.grue_in_room?.should eq(false)
  end

  it "should know grue is in same room as player" do
    player = Player.new({location: :burnt_sienna, rubies: 0})
    grue = Grue.new({location: :burnt_sienna, sleep: 6})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_in_room?.should eq(true)
  end

  it "should add to grue's sleep counter" do
    player = Player.new({location: :burnt_sienna, rubies: 0})
    grue = Grue.new({location: :burnt_sienna, sleep: 8})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.grue_sleeps.should eq(9)
  end

  it "should know when player has won" do
    player = Player.new({location: :cobalt, rubies: 4})
    grue = Grue.new({location: :vermillion, sleep: 6})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.win?.should eq(false)
  end

  it "should know when player has won" do
    player = Player.new({location: :burnt_sienna, rubies: 5})
    grue = Grue.new({location: :violet, sleep: 6})
    direct = {routes: :east, exit: :cobalt, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.win?.should eq(false)
  end

  it "should know when player has won" do
    player = Player.new({location: :burnt_sienna, rubies: 5})
    grue = Grue.new({location: :vermillion, sleep: 3})
    direct = {routes: :east, exit: :burnt_sienna, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.win?.should eq(true)
  end

  it "should not be over when starting" do
    game.gameover?.should eq(false)
  end

  it "should not be over with short amount of rubies in the exit room" do
    player = Player.new({location: :lavender, rubies: 4})
    grue = Grue.new({location: :burnt_sienna, sleep: 1})
    direct = {routes: :east, exit: :lavender, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.gameover?.should eq(false)
  end

  it "should not be over with enough rubies but not in the exit room" do
    player = Player.new({location: :cobalt, rubies: 7})
    grue = Grue.new({location: :burnt_sienna, sleep: 1})
    direct = {routes: :east, exit: :vermillion, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.gameover?.should eq(false)
  end

  it "should be over when player and grue are in same room" do
    player = Player.new({location: :violet, rubies: 0})
    grue = Grue.new({location: :violet, sleep: 1})
    direct = {routes: :east, exit: :aquamarine, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.gameover?.should eq(true)
  end

  it "should be over when player has rubies and in exit" do
    player = Player.new({location: :violet, rubies: 5})
    grue = Grue.new({location: :burnt_sienna, sleep: 1})
    direct = {routes: :east, exit: :violet, progress: true, win: false}
    game = GamePlay.new(player, grue, direct)
    game.gameover?.should eq(true)
  end
end
