# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name "Example Bar"
    description "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
    proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    street_address "123 Example St"
    postcode 2000
    suburb "Sydney"
    phone_number "9520 8000"
    email "email@example.com"
    url "http://www.example.com/"
  end
end
