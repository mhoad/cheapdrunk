module VenuesHelper
    def business_hours()
        hours = " #{@venue.trading_times.monday_opens_at}:#{@venue.trading_times.monday_closes_at}" 
    end
end
