require 'rails_helper'

describe "Map" do

  let(:map) {Map.new}

  it "should generate a random room hash" do
    Map.random_room.class.should eq(Symbol)
  end

  it "should return the correct name of the room" do
    room = :violet
    Map.name_of_room(room).should eq("Violet Room")
  end

  it "should return the correct name of the room" do
    room = :aquamarine
    Map.name_of_room(room).should eq("Aquamarine Room")
  end

  it "should return the correct name of the room" do
    room = :cobalt
    Map.name_of_room(room).should eq("Cobalt Room")
  end

  it "should return the correct name of the room" do
    room = :lavender
    Map.name_of_room(room).should eq("Lavender Room")
  end

  it "should return symbol of next room" do
    room = :ochre
    direction = :north
    Map.next_room(room, direction).should eq(:vermillion)
  end

  it "should return symbol of next room" do
    room = :emerald
    direction = :east
    Map.next_room(room, direction).should eq(:lavender)
  end

  it "should return symbol of next room" do
    room = :aquamarine
    direction = :south
    Map.next_room(room, direction).should eq(:violet)
  end

  it "should return symbol of next room" do
    room = :violet
    direction = :west
    Map.next_room(room, direction).should eq(:chartreuse)
  end

  it "should return symbol of next room" do
    room = :vermillion
    direction = :south
    Map.next_room(room, direction).should eq(:aquamarine)
  end

  it "should return symbol of next room" do
    room = :burnt_sienna
    direction = :north
    Map.next_room(room, direction).should eq(:emerald)
  end

  it "should return symbol of next room" do
    room = :lavender
    direction = :east
    Map.next_room(room, direction).should eq(:chartreuse)
  end

  it "should return array of the 3 exits" do
    room = :violet
    answer = [:burnt_sienna, :burnt_sienna, :chartreuse]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 3 exits" do
    room = :emerald
    answer = [:lavender, :aquamarine, :cobalt]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 3 exits" do
    room = :cobalt
    answer = [:vermillion, :burnt_sienna, :vermillion]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 2 exits" do
    room = :lavender
    answer = [:chartreuse, :burnt_sienna]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 2 exits" do
    room = :burnt_sienna
    answer = [:emerald, :lavender]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return array of 2 exits" do
    room = :aquamarine
    answer = [:violet, :cobalt]
    Map.neighboring_rooms(room).should eq(answer)
  end

  it "should return true when door is available" do
    Map.door_available?(:vermillion, :east).should eq(true)
  end

  it "should return true when door is available" do
    Map.door_available?(:ochre, :north).should eq(true)
  end

  it "should return true when door is available" do
    Map.door_available?(:lavender, :west).should eq(true)
  end

  it "should return true when door is available" do
    Map.door_available?(:emerald, :south).should eq(true)
  end

  it "should return true when door is not available" do
    Map.door_available?(:chartreuse, :west).should eq(false)
  end

  it "should return true when door is not available" do
    Map.door_available?(:cobalt, :east).should eq(false)
  end

  it "should return true when door is not available" do
    Map.door_available?(:burnt_sienna, :south).should eq(false)
  end

  it "should return cardinal exits of a room" do
    room = :violet
    exits = [:east, :south, :west]
    Map.cardinal_exits(room).should eq(exits)
  end

  it "should return cardinal exits of a room" do
    room = :chartreuse
    exits = [:north, :south]
    Map.cardinal_exits(room).should eq(exits)
  end

  it "should return cardinal exits of a room" do
    room = :emerald
    exits = [:east, :south, :west]
    Map.cardinal_exits(room).should eq(exits)
  end

  it "should return cardinal exits of a room" do
    room = :cobalt
    exits = [:north, :south, :west]
    Map.cardinal_exits(room).should eq(exits)
  end

  it "should return cardinal exits of a room" do
    room = :lavender
    exits = [:east, :west]
    Map.cardinal_exits(room).should eq(exits)
  end

  it "should spawn away from Violet Room" do
    rooms = [:ochre, :chartreuse, :cobalt, :lavender,:burnt_sienna]
    rooms.include?(Map.spawn_away_from(:violet)).should eq(true)
  end

  it "should spawn away from Cobalt Room" do
    rooms = [:ochre, :lavender, :violet]
    rooms.include?(Map.spawn_away_from(:cobalt)).should eq(true)
  end
end
