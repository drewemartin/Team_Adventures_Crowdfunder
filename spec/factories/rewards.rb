# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reward do
    description "MyText"
    amount 1
    project nil
  end
end
