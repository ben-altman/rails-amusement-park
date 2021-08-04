class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        # byebug
        if short_and_lack_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif not_enough_tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif not_tall_enough
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            after_ride
            "Enjoy the ride."
        end
    end

    def not_enough_tickets
        user.tickets < attraction.tickets
    end

    def not_tall_enough
        user.height < attraction.min_height
    end

    def short_and_lack_tickets
        not_enough_tickets && not_tall_enough 
    end

    def after_ride
        user.tickets -= attraction.tickets
        user.happiness += attraction.happiness_rating
        user.nausea += attraction.nausea_rating
        user.save
    end
end
