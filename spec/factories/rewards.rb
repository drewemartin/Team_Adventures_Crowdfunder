# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reward do
    description {Faker::Company.catch_phrase}
    amount {Faker::Number.number(10)}
    project 
  end
end
