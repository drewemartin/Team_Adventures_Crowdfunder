# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    description "MyText"
    title "MyString"
    goal 1
    start_time "2014-07-16 14:12:09"
    end_time "2014-07-16 14:12:09"
    picture_url "MyString"
    user nil
    category nil
  end
end
