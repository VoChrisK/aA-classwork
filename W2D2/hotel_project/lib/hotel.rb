require_relative "room"

class Hotel
    attr_reader :rooms


    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |k, v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        @name.split(" ").map { |ele| ele.capitalize }.join(" ")
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end
  
    def check_in(person, room_name)
        if !self.room_exists?(room_name)
            p "sorry, room does not exist"
        else
            if @rooms[room_name].add_occupant(person)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        !@rooms.all? { |k, v| @rooms[k].full? }
    end

    def list_rooms
        @rooms.each do |room_name, room|
            puts room_name + " " + room.available_space.to_s
        end
    end
end

