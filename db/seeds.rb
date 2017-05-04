# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)


# Seed Users
# user = {}
# user['password'] = '123456'

# ActiveRecord::Base.transaction do
#   20.times do 
#     user['full_name'] = Faker::Pokemon.name
#     user['email'] = Faker::Internet.email
#     user['gender'] = rand(0..2)
#     user['age'] = rand(18..110)
#     user['avatar'] = Faker::Avatar.image(Faker::Lorem.word, "100x100")
#     User.create(user)
#   end
# end 

# # Seed Listings
# listing = {}
# uids = []
# User.all.each { |u| uids << u.id }
# ActiveRecord::Base.transaction do
#   40.times do 
#     listing['title'] = Faker::LordOfTheRings.location  
#     listing['description'] = Faker::Hipster.sentence
#     listing['property_type'] = ["house", "apartment"].sample
#     listing['room_type'] = ["shared_room", "private_room", "entire_room"].sample
#     listing['guest'] = rand(0..16)
#     listing['bedroom'] = rand(1..10)
#     listing['bathroom'] = rand(1..8)
#     listing['price'] = rand(80..500)
#     listing['address'] = Faker::StarWars.planet
#     listing['tag_ids'] = rand(1..6)
    
    
#     listing['user_id'] = uids.sample
    
#     Listing.create(listing)
#   end
# end

