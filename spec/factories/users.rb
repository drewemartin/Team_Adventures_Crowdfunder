# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'
FactoryGirl.define do
  factory :user do
  	email {Faker::Internet.email} 
  	crypted_password "1234"
  	salt {Faker::Lorem.word}
  	username {Faker::Name.name}
  	biography {Faker::Lorem.sentence}
  	phone {Faker::PhoneNumber.phone_number}
  end
end

