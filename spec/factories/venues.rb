# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    name "MyString"
    description "MyText"
    street_address "MyString"
    postcode 1
    suburb "MyString"
    phone_number "MyString"
    email "MyString"
    url "MyString"
  end
end
