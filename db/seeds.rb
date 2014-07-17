# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = %w(Entertainment Film  Music Art)

categories.each do |name| 
  Category.create(:name => name)
end



10.times do |title, description, goal, start_time, end_time, picture_url, category|
  start_time = DateTime.new
  end_time = DateTime.new + 3.days
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

10.times do |username, crypted_password,salt, email |
  User.create(:username => Faker::Name.name,:crypted_password => Faker::Code.ean, :salt => Faker::Code.ean, :email => Faker::Internet.email  )
end

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => Category.first,
    :user_id => User.first
    )
end