# == Schema Information
#
# Table name: venues
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :text
#  street_address :string(255)
#  postcode       :integer
#  suburb         :string(255)
#  phone_number   :string(255)
#  email          :string(255)
#  url            :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#

class Venue < ActiveRecord::Base
  attr_accessible :description, :email, :name, :phone_number, :postcode, :street_address, :suburb, :url

  #Validations to ensure clean data

  before_save { |venue| venue.email   = email.downcase }
  before_save { |venue| venue.url     = url.downcase }
  before_save { |venue| venue.suburb  = suburb.camelcase }

  VALID_EMAIL_REGEX   = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_URL_REGEX     = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
  VALID_SUBURB_REGEX  = /^\w[a-zA-Z ]+$/ #Letters only

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :url, presence: true, format: { with: VALID_URL_REGEX }
  validates :postcode, presence: true, length:{ is: 4 } #Australian post codes are 4 digits
  validates :description, length:{ maximum: 500, minimum: 100 }
  validates :suburb, presence: true, format: { with: VALID_SUBURB_REGEX }, length:{ maximum: 20, minimum: 3 }

end
