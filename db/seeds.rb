# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


category = %w(Entertainment Film  Music Art)

10.times do |title, description, goal, start_time, end_time, picture_url, category|
  start_time =
  end_time = 
  title = 
  description = 
  photo_url = rand(1..9)


  Restaurant.create( 
    :title => title,
    :capacity => capacity,
    :picture_url => picture_url,
    :category_id => category.id
    :user_id => user.id
    )
end