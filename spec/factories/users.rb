# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'
FactoryGirl.define do
  factory :user do
  	email {Faker::Internet.email} 
  	password_confirmation "1234"
  	password "1234"
  	username {Faker::Name.name}
  	biography {Faker::Lorem.sentence}
  	phone {Faker::PhoneNumber.phone_number}
  end
end
