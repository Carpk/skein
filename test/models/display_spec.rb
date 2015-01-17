require_relative "../config"
require_relative "../lib/labyrinth/console"

describe DisplayUtility do

  let(:display)  {DisplayUtility.new}

  it "should inform no door exists" do
    STDOUT.should_receive(:puts).with("...there does not appear to be a door here")
    display.no_door
  end

  it "should inform of your rest move" do
    STDOUT.should_receive(:puts).with("You have had 5 consecutive turns, you take time to rest.")
    STDOUT.should_receive(:puts).with("It suddenly gets a little darker, but only for a brief moment")
    display.rest
  end

  it "should inform amount of rubies and the exit" do
    STDOUT.should_receive(:puts).with("You have obtained 7 Rubies, make your way to the Cobalt Room.")
    rubies = 7
    exit = "Cobalt Room"
    display.prompt_exit(rubies, exit)
  end

  it "should inform amount of rubies and the exit" do
    STDOUT.should_receive(:puts).with("You have obtained 9 Rubies, make your way to the Emerald Room.")
    rubies = 9
    exit = "Emerald Room"
    display.prompt_exit(rubies, exit)
  end

  it "should inform of your rest move" do
    STDOUT.should_receive(:puts).with("you are in the Cobalt Room")
    STDOUT.should_receive(:puts).with("which way would you like to move next?")
    display.choose_direction("Cobalt Room")
  end

  it "should inform of your rest move" do
    STDOUT.should_receive(:puts).with("you are in the Ochre Room")
    STDOUT.should_receive(:puts).with("which way would you like to move next?")
    display.choose_direction("Ochre Room")
  end

  it "should inform of the amount of rubies you have" do
    STDOUT.should_receive(:puts).with("As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door.")
    STDOUT.should_receive(:puts).with("But lo and behold, you find a beautiful shining Ruby in the middle of the floor!")
    STDOUT.should_receive(:puts).with("You have 1 Ruby!")
    num_rubies = 1
    display.grue_flee(num_rubies)
  end

  it "should inform of the amount of rubies you have" do
    STDOUT.should_receive(:puts).with("As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door.")
    STDOUT.should_receive(:puts).with("But lo and behold, you find a beautiful shining Ruby in the middle of the floor!")
    STDOUT.should_receive(:puts).with("You have 2 Rubies!")
    num_rubies = 2
    display.grue_flee(num_rubies)
  end

  it "should inform of the amount of rubies you have" do
    STDOUT.should_receive(:puts).with("As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door.")
    STDOUT.should_receive(:puts).with("But lo and behold, you find a beautiful shining Ruby in the middle of the floor!")
    STDOUT.should_receive(:puts).with("You have 3 Rubies!")
    num_rubies = 3
    display.grue_flee(num_rubies)
  end

  it "should inform of the amount of rubies you have" do
    STDOUT.should_receive(:puts).with("As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door.")
    STDOUT.should_receive(:puts).with("But lo and behold, you find a beautiful shining Ruby in the middle of the floor!")
    STDOUT.should_receive(:puts).with("You have 7 Rubies!")
    num_rubies = 7
    display.grue_flee(num_rubies)
  end

  it "should inform of a losing game" do
    STDOUT.should_receive(:puts).with("Then the room plunges into a pitch black darkness.")
    STDOUT.should_receive(:puts).with("The Grue enters the room and removes you from existance.")
    STDOUT.should_receive(:puts).with("Game over.")
    display.gameover_lose
  end

  it "should inform of winning game" do
    STDOUT.should_receive(:puts).with("As you enter the room, you see a ray of light coming from the corner of the room")
    STDOUT.should_receive(:puts).with("You push a few bolders out of the way, the light gets brighter and brighter.")
    STDOUT.should_receive(:puts).with("You have found a way out! Congratulation! You have won the game!")
    display.gameover_win
  end
end
