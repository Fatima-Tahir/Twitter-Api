# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

p "0. destroying all data"

Following.destroy_all
Tweet.destroy_all
TwitterUser.destroy_all

p "1. Creating TwitterUser..."
30.times do
    username = Faker::Twitter.screen_name
    TwitterUser.create(username: username , email: "#{username}@gmail.com", password: '123456')
end

p "2. Creating Tweets..."
70.times do
    Tweet.create(twitter_user_id: rand(1..30), body: Faker::Lorem.sentence())
end

p "3.Creating Followings"
300.times do
    Following.create(followed_id: rand(1..30), follower_id: rand(1..30))
end