class Review < ActiveRecord::Base
  attr_accessible :comment, :rating, :user_id, :venue_id

  belongs_to :user
  belongs_to :venue
end
