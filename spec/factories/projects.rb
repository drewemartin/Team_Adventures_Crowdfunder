# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :project do
    user
    title {Faker::Hacker.noun}
    goal{Faker::Number.number(7)}
    start_time DateTime.now + 7.hours
    end_time { start_time ? start_time + 4.days : 4.days.since }
    category 
    description {Faker::Lorem.characters(100)}
    picture_url{Faker::Company.logo}
  end
end
