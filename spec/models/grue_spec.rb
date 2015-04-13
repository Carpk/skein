require 'rails_helper'

describe "Grue" do

  let(:monster) {Grue.new({location: :violet, sleep: 1})}

  it "should know when grue is asleep" do
    monster.asleep?.should eq(true)
  end

  it "should know when grue is asleep" do
    monster = Grue.new({location: :violet, sleep: 3})
    monster.asleep?.should eq(true)
  end

  it "should know when grue is asleep" do
    monster = Grue.new({location: :violet, sleep: 4})
    monster.asleep?.should eq(true)
  end

  it "should know when grue is asleep" do
    monster = Grue.new({location: :violet, sleep: 7})
    monster.asleep?.should eq(true)
  end

  it "should know when grue is asleep" do
    monster = Grue.new({location: :violet, sleep: 16})
    monster.asleep?.should eq(true)
  end

  it "should know when grue is asleep" do
    monster = Grue.new({location: :violet, sleep: 21})
    monster.asleep?.should eq(true)
  end

  it "should know when grue is not asleep" do
    monster = Grue.new({location: :aquamarine, sleep: 6})
    monster.asleep?.should eq(false)
  end

  it "should know when grue is not asleep" do
    monster = Grue.new({location: :aquamarine, sleep: 12})
    monster.asleep?.should eq(false)
  end

  it "should know when grue is not asleep" do
    monster = Grue.new({location: :aquamarine, sleep: 18})
    monster.asleep?.should eq(false)
  end

  it "should increment sleep counter" do
    monster.sleep_turn.should eq(2)
  end

  it "should increment sleep counter" do
    monster = Grue.new({location: :ochre, sleep: 3})
    monster.sleep_turn.should eq(4)
  end

  it "should increment sleep counter" do
    monster = Grue.new({location: :lavender, sleep: 4})
    monster.sleep_turn.should eq(5)
  end

  it "should move closer to player" do
    monster.move_to(:vermillion).should eq(:chartreuse)
  end

  it "should move closer to player" do
    monster.move_to(:emerald).should eq(:burnt_sienna)
  end

  it "should move closer to player" do
    monster = Grue.new({location: :aquamarine, sleep: 0})
    monster.move_to(:vermillion).should eq(:cobalt)
  end

  it "should know if grue has found the player" do
    monster.found_player?(:violet).should eq(true)
  end

  it "should know if grue has found the player" do
    monster = Grue.new({location: :ochre, sleep: 0})
    monster.found_player?(:ochre).should eq(true)
  end

  it "should know if grue has found the player" do
    monster = Grue.new({location: :vermillion, sleep: 0})
    monster.found_player?(:vermillion).should eq(true)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:ochre).should eq(false)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:vermillion).should eq(false)
  end

  it "should know if grue has not found the player" do
    monster.found_player?(:chartreuse).should eq(false)
  end

  it "should sent grue through random door" do
    rooms = [:burnt_sienna, :chartreuse]
    rooms.include?(monster.flee_room).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:ochre, :aquamarine]
    monster = Grue.new({location: :vermillion, sleep: 0})
    rooms.include?(monster.flee_room).should eq(true)
  end

  it "should sent grue through random door" do
    rooms = [:chartreuse, :burnt_sienna]
    monster = Grue.new({location: :lavender, sleep: 0})
    rooms.include?(monster.flee_room).should eq(true)
  end
end