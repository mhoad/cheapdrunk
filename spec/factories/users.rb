# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :admin_user, class: User do
  	name 'Admin User'
  	email 'admin@admin.com'
  	password 'bossman'
  	password_confirmation 'bossman'
  	admin true
  end
end