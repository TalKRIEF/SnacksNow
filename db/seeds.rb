# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Clear database"
Snack.destroy_all
User.destroy_all

puts "Create diego user"
diego = User.create!(username: "dddiiieegggooooooo", email:"zmsntjdn@gmail.com", password: "azerty")

puts "Create some snacks"
snack1 = {name: "Sucreries de Haingo", description: "Une description est en cours de rédaction!", price: 2, user_id: diego.id}
snack2 = {name: "Bananes de Diego", description: "Une description est en cours de rédaction!", price: 3, user_id: diego.id}
[snack1, snack2].each do |attrs|
  snack = Snack.create!(attrs)
  puts "Created #{snack.name}!"
end
puts "Finished"
