require_relative '../../lib/config'

class Map
  class << self

    def random_room
      map = MapConfig::Map
      map.to_a[rand(0..map.length-1)].first
    end

    def name_of_room(room_symbol)
      MapConfig::Map[room_symbol][:name]
    end

    def possible_routes(room_symbol)
      map = MapConfig::Map
      valid_routes = []
      map[room_symbol].each do |key, value|
        valid_routes << key if value.class == Symbol
      end
      valid_routes
    end

    def next_room(room, direction)
      MapConfig::Map[room][direction]
    end

    def neighboring_rooms(room_symbol)
      room = MapConfig::Map[room_symbol]
      doors = []
      room.each_value do |door|
        doors << door unless door.class != Symbol
      end
      doors
    end

    def door_available?(room_symbol, direction)
      available_doors = Map.cardinal_exits(room_symbol)
      available_doors.include?(direction)
    end

    def cardinal_exits(room_symbol)
      room = MapConfig::Map[room_symbol]
      directions = []
      room.each do |direction, possible_door|
        directions << direction if possible_door.class == Symbol
      end
      directions
    end

    def spawn_away_from(ward)
      possible_spawn = Map.random_room
      if Compass.find_target(possible_spawn, ward).length > 3
        possible_spawn
      else
        self.spawn_away_from(ward)
      end
    end
  end
end
