# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  name                   :string(255)
#  admin                  :boolean         default(FALSE)
#  oauth                  :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :admin, :oauth
  # attr_accessible :title, :body

  #Validations to ensure clean data

  before_save { |user| user.email = email.downcase }

  VALID_NAME_REGEX = /^\w[a-zA-Z ]+$/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true, length:{ maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } 

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
  data = access_token.extra.raw_info
  if user = self.find_by_email(data.email)
    user
  else # Create a user with a stub password. 
    self.create!(:name => data.first_name, :email => data.email, :password => Devise.friendly_token[0,20], :oauth => true) 
  end
end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"]
        user.name = data["first_name"]
      end
    end
  end

  #config omniauth twitter
def self.find_for_twitter_oauth(access_token, signed_in_resource = nil)
    data = access_token.extra.raw_info
    if user = User.where(:name => data.screen_name).first
        user
    else
        #Temporary hack to resolve the required email issue with Twitter and Devise
        User.create!(:name => data.screen_name, :email => "#{data.screen_name}@twitter.com", 
                                          :password => Devise.friendly_token, :oauth => true)
    end
end
end
