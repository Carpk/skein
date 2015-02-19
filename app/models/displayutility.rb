# class DisplayUtility

#   def no_door
#     puts "...there does not appear to be a door here"
#   end

#   def clear_screen
#     print "\e[2J"
#   end

#   def move_cursor_to_top
#     print "\e[H"
#   end

#   def rest
#     puts "You have had 5 consecutive turns, you take time to rest."
#     puts "It suddenly gets a little darker, but only for a brief moment"
#   end

#   def prompt_exit(rubies, exit)
#     puts "You have obtained #{rubies} Rubies, make your way to the #{exit}."
#   end

#   def choose_direction(room)
#     puts "you are in the #{room}"
#     puts "which way would you like to move next?"
#     gets.chomp
#   end

#   def grue_flee(num_rubies)
#     singular = "Ruby" if num_rubies == 1
#     puts "As you enter the room, you hear the clamering of feet and strange gruntings followed by the closing of another door."
#     puts "But lo and behold, you find a beautiful shining Ruby in the middle of the floor!"
#     puts "You have #{num_rubies} #{singular ||= "Rubies"}!"
#   end

#   def gameover_lose
#     puts "Then the room plunges into a pitch black darkness."
#     puts "The Grue enters the room and removes you from existance."
#     puts "Game over."
#   end

#   def gameover_win
#     puts "As you enter the room, you see a ray of light coming from the corner of the room"
#     puts "You push a few bolders out of the way, the light gets brighter and brighter."
#     puts "You have found a way out! Congratulation! You have won the game!"
#   end

#   def instructions(exit_room)
#     clear_screen
#     move_cursor_to_top
#     print <<-EOF
#     Welcome to Labyrinth

#     Navigate using the commands north, south, east, and west.

#     You must collect 5 gems and head to the #{exit_room} to win the game.
#     If the grue enters your room at anytime, he will devoure you and
#     you will lose the game. Good Luck!

#     Press enter to begin
#     EOF
#     gets
#     clear_screen
#     move_cursor_to_top
#   end
# end