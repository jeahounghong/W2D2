class Room
    attr_reader :capacity, :occupants

    def initialize(capacity)
        @capacity = capacity
        @occupants = []

    end

    def full?
        return @occupants.length == @capacity
    end

    def available_space
        return capacity - @occupants.length
    end

    def add_occupant(name)
        if full?
            return false
        else
            @occupants << name
            true
        end
    end
end