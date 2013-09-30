# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    user
    title "Best Project!"
    teaser "This project should make me a million dollars"
    description "blah blah blah"
    goal 1000000
  end
end

