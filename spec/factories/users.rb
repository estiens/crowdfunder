# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:email) {|n| "johndoe#{n}@gmail.com"}
    password ("password")
  end
end
