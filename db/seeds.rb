# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# --------------------------------------------------
# Seeding fake restaurants for data purposes

Comment.destroy_all
Restaurant.destroy_all
User.destroy_all

puts 'Destroying all comments'
puts 'Destroying all user'
puts 'Destroying all restaurants'

# # Create user
user1 = User.create(email: "michael@email.com", password: "testtest")
user2 = User.create(email: 'sam@email.com', password: 'testtest')
puts 'Created users'

# Creating 2 restaurants
puts "Creating 2 restaurants"
restaurant1 = Restaurant.create(name: "Kogane", address: "Meguro", user: user1)
restaurant2 = Restaurant.create(name: "Hachigo", address: "Ginza", user: user1)
puts "Created 2 restaurants"

# Create 10 restaurants
puts 'Creating 10 random restaurants'

10.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    user: user1
  )
end

puts 'Created 10 restaurants'

# Create comments for restaurant 1
puts "Creating comments"
comment1 = Comment.create(user: user2, restaurant_id: restaurant1.id, content: "very good!")

# Create comment for restaurant 2
comment2 = Comment.create(user: user2, restaurant_id: restaurant2.id, content: "super delicious!")

puts "Created comments"
# ------------------------------------------------
