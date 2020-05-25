class Dock
attr_reader :name,
            :max_rental_time,
            :rental_log

    def initialize(name, max_rental_time)
      @name = name
      @max_rental_time = max_rental_time
      @rental_log = Hash.new
      @charge = Hash.new
    end

    def rent(boat_type, renter)
      @rental_log[boat_type] = renter
    end

    def charge(boat)
      @charge[:card_number] = @rental_log[boat].credit_card_number

        if boat.hours_rented > @max_rental_time
            @charge[:amount] = (@max_rental_time * boat.price_per_hour)
        else boat.hours_rented < @max_rental_time
            @charge[:amount] = (boat.hours_rented * boat.price_per_hour)
        end
      @charge
    end

end
