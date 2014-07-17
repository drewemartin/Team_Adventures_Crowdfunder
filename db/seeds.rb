# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = %w(Entertainment Film Music Art Fashion Food Games Photography)
r_username = %w(matt weiyi drew sandy chad julie ryan fabio lorie mike)
username = r_username[(rand(0..10))]

categories.each do |name| 
  Category.create(:name => name)
end

r_username.each do |username|
  User.create(:username => username, :email => Faker::Internet.email, :crypted_password => Faker::Code.ean, :salt => Faker::Code.ean, :email => Faker::Internet.email  )
end


entertainment = Category.where(:name => "Entertainment").first
film = Category.where(:name => "Film").first
music = Category.where(:name => "Music").first
art = Category.where(:name => "Art").first
fashion = Category.where(:name => "Fashion").first
game = Category.where(:name => "Games").first
photography = Category.where(:name => "Photography").first
user = User.where(:username => "sandy").first

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new + 7.hour
  end_time = DateTime.new + 4.days
  goal = 10
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => entertainment.id,
    :user_id => user
    )
end

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new
  goal = 20
  end_time = DateTime.new + 3.days
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => film.id,
    :user_id => user
    )
end

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new
  goal = 45
  end_time = DateTime.new + 3.days
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => art.id,
    :user_id => user
    )
end

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new
  end_time = DateTime.new + 3.days
  goal = 34
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)
  
  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => fashion.id,
    :user_id => user
    )
end

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new
  end_time = DateTime.new + 3.days
  goal = 56
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => game.id,
    :user_id => user
    )
end

10.times do |title, description, goal, start_time, end_time, picture_url, category, user|
  start_time = DateTime.new
  end_time = DateTime.new + 3.days
  goal = 78
  title = Faker::Company.name
  description = Faker::Lorem.paragraph
  picture_url = rand(1..9)

  Project.create( 
    :title => title,
    :description => description,
    :picture_url => picture_url,
    :category_id => photography.id,
    :user_id => user
    )
end