class Compass

  def self.move_to_target(current_room, target_room)
    rooms = self.find_target(current_room, target_room)
    rooms[1]
  end

  def self.find_target(current_room, target, route = [], shortest_route = Array.new(6, ""))
    route << current_room
    if Map.name_of_room(current_room) == Map.name_of_room(target)
      shortest_route = route.dup if route.length < shortest_route.length
    end
    Map.neighboring_rooms(current_room).each do |next_door|
      break if route.length >= shortest_route.length
      if next_door.class == Symbol
        shortest_route = self.find_target(next_door, target, route, shortest_route)
      end
    end
    route.pop
    shortest_route
  end

end