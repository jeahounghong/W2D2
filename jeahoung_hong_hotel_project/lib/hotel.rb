require_relative "room"

class Hotel

    attr_reader :rooms

    def initialize(name, hash)
        @name = name
        @rooms = {}
        hash.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        arr = @name.split(" ")
        arr.each_with_index {|el,i| arr[i] = el.capitalize}
        return arr.join(" ")
    end

    def room_exists?(str)
        return @rooms.has_key?(str)
    end

    def check_in(name, room)
        if !room_exists?(room)
            p "sorry, room does not exist"
        else
            if @rooms[room].add_occupant(name)
                p "check in successful"
            else
                p "sorry, room is full"
            end
        end
    end

    def has_vacancy?
        @rooms.each do |k,v|
            return true if !v.full?
        end
        false
    end

    def list_rooms
        @rooms.each { |name, room| puts "#{name} : #{room.available_space}" }
    end
end
