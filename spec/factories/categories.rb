# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'
FactoryGirl.define do
  factory :category do
    name {Faker::Commerce.department}
  end
end
