# == Schema Information
#
# Table name: trading_times
#
#  id                  :integer         not null, primary key
#  venue_id            :integer
#  monday_opens_at     :datetime
#  monday_closes_at    :datetime
#  tuesday_opens_at    :datetime
#  tuesday_closes_at   :datetime
#  wednesday_opens_at  :datetime
#  wednesday_closes_at :datetime
#  thursday_opens_at   :datetime
#  thursday_closes_at  :datetime
#  friday_opens_at     :datetime
#  friday_closes_at    :datetime
#  saturday_opens_at   :datetime
#  saturday_closes_at  :datetime
#  sunday_opens_at     :datetime
#  sunday_closes_at    :datetime
#

require 'spec_helper'

describe TradingTime do
  pending "add some examples to (or delete) #{__FILE__}"
end
