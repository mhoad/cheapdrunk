# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :trading_time do
    venue_id 1
    monday_opens_at "2012-05-16 15:30:01"
    monday_closes_at "2012-05-16 15:30:01"
    tuesday_opens_at "2012-05-16 15:30:01"
    tuesday_closes_at "2012-05-16 15:30:01"
    wednesday_opens_at "2012-05-16 15:30:01"
    wednesday_closes_at "2012-05-16 15:30:01"
    thursday_opens_at "2012-05-16 15:30:01"
    thursday_closes_at "2012-05-16 15:30:01"
    friday_opens_at "2012-05-16 15:30:01"
    friday_closes_at "2012-05-16 15:30:01"
    saturday_opens_at "2012-05-16 15:30:01"
    saturday_closes_at "2012-05-16 15:30:01"
    sunday_opens_at "2012-05-16 15:30:01"
    sunday_closes_at "2012-05-16 15:30:01"
  end
end
