# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    comment "MyText"
    user nil
    project nil
  end
end
