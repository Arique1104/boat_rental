class Dock
attr_reader :name,
            :max_rental_time,
            :rental_log,
            :revenue

    def initialize(name, max_rental_time)
      @name = name
      @max_rental_time = max_rental_time
      @rental_log = {}
      @charge = {}
      @revenue = 0
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

    def log_hour
      @rental_log.each do |boat, renter|
        boat.add_hour
      end
    end

    def return(boat)
      @revenue += charge(boat)[:amount]
    end


end
