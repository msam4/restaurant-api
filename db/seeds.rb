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

# User.destroy_all
# Restaurant.destroy_all

# puts 'Destroying all user'
# puts 'Destroying all restaurants'

# # Create user
# user = User.create(email: 'sam@email.com', password: 'testtest')
# puts 'Created user'

# # Create 10 restaurants
# puts 'Creating 10 restaurants'

# 10.times do
#   Restaurant.create(
#     name: Faker::Restaurant.name,
#     address: Faker::Address.full_address,
#     user: user
#   )
# end

# puts 'Created 10 restaurants'
# ------------------------------------------------
