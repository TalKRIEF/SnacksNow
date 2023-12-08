# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "Clear database:"
puts "Destroy bookings"
Booking.destroy_all
puts "Destroy snacks"
Snack.destroy_all
puts "Destroy users"
User.destroy_all
puts "Create users:"
puts "Create diego user"
diego = User.create!(username: "dddiiieegggooooooo", email:"diego@gmail.com", password: "azerty")
puts "Create tal user"
tal = User.create!(username: "tal", email:"tal@gmail.com", password: "azerty")
puts "Create nina user"
nina = User.create!(username: "nina", email:"nina@gmail.com", password: "azerty")
puts "Create haingo user"
haingo = User.create!(username: "haingo", email:"haingo@gmail.com", password: "azerty")
puts "Create heba user"
heba = User.create!(username: "heba", email: "heba@gmail.com", password: "azerty")
puts "Create some snacks:"

puts "Sucreries de Haingo"
snack1 = Snack.new(name: "Sucreries de Haingo", description: "Une bonne dose de sucre pour éviter l'hypoglycémie! Proposée avec un grand sourire! C'est presque gratuit!", address: "21 Rue Haxo, Marseille", price: 2.99, user_id: haingo.id)
snack1_photo = URI.open("https://www.generation-souvenirs.com/27476-product_large/chamallows-haribo.jpg")
snack1.photo.attach(io: snack1_photo, filename: "bonbons.jpg", content_type: "image/jpg")
snack1.save!
puts "done!"

puts "La pomme d'Anthonny"
snack2 = Snack.new(name: "La pomme d'Anthonny", description: "Délice de la part de l'ex-charpentier canadien!", address: "Aix-en-Provence", price: 6.66, user_id: tal.id)
snack2_photo = URI.open("https://www.jardindupicvert.com/media/catalog/product/p/o/pommier-reinette-grise-du-canada-9700.jpg")
snack2.photo.attach(io: snack2_photo, filename: "pomme.jpg", content_type: "image/jpg")
snack2.save!
puts "done!"

puts "Les clopes de Nina"
snack3 = Snack.new(name: "Les clopes de Nina", description: "Elles ne sont pas en chocolat mais il faut bien de quoi payer le loyer...", address: "Lodi, Marseille", price: 48.99, user_id: nina.id)
snack3_photo = URI.open("https://cdn.generationvoyage.fr/2020/08/Paquet.jpg")
snack3.photo.attach(io: snack3_photo, filename: "cigarettes.jpg", content_type: "image/jpg")
snack3.save!
puts "done!"

puts "Le croissant de Marina"
snack4 = Snack.new(name: "Le croissant de Marina", description: "Vous avez manqué le petit-déjeuner, mais vous ne manquerez pas de croissant!", address: "45 Rue Francis Davso, Marseille" ,price: 1.99, user_id: tal.id)
snack4_photo = URI.open("https://s3-eu-west-1.amazonaws.com/images-ca-1-0-1-eu/tag_photos/original/1727/croissant_flickr_242518635_5e450f4a17_b.jpg")
snack4.photo.attach(io: snack4_photo, filename: "croissant.jpg", content_type: "image/jpg")
snack4.save!
puts "done!"

puts "Les Pom'potes de Tal"
snack5 = Snack.new(name: "Les  Pom'potes de Tal", description: "Ne lui dites pas que vous avez vu l'annonce ici...", address: "Sanary-sur-Mer", price: 15.99, user_id: diego.id)
snack5_photo = URI.open("https://i0.wp.com/parismamanetmoi.com/wp-content/uploads/2014/09/pom-potes-1.jpg")
snack5.photo.attach(io: snack5_photo, filename: "pompote.jpg", content_type: "image/jpg")
snack5.save!
puts "done!"

puts "La pizza Regina de Heba"
snack6 = Snack.new(name: "La pizza Regina de Heba", description: "Petit twist gustatif: pas de jambon de pays, mais du jambon de dinde", address: "Saint-Barnabé, Marseille", price: 18, user_id: heba.id)
snack6_photo = URI.open("https://www.einfachkochen.de/sites/einfachkochen.de/files/styles/700_530/public/2022-06/pizza_regina_2.jpg")
snack6.photo.attach(io: snack6_photo, filename: "pizza.jpg", content_type: "image/jpg")
snack6.save!
puts "done!"

puts "Les biscuits Petit-Déjeuner de Benjamin"
snack7 = Snack.new(name: "Les biscuits Petit-Déjeuner de Benjamin", description: "Une médaille d'or pour ce biscuit et sa performance sonore exceptionnelle lors des leçons du matin!", address: "Périer", price: 9.99, user_id: heba.id)
snack7_photo = URI.open("https://media.paperblog.fr/i/723/7235524/belvita-petit-dejeuner-lu-biscuits-petit-deje-T-_Irg8X.jpeg")
snack7.photo.attach(io: snack7_photo, filename: "biscuits.jpeg", content_type: "image/jpeg")
snack7.save!
puts "done!"

puts "Create some bookings:"
puts "diego => La pomme d'Anthonny"
Booking.create(user_id: diego.id, snack_id: snack2.id, booked: false, date: Date.today)
puts "done!"
puts "nina => La pomme d'Anthonny"
Booking.create(user_id: nina.id, snack_id: snack2.id, booked: false, date: Date.today)
puts "done!"
puts "diego => Le croissant de Marina"
Booking.create(user_id: diego.id, snack_id: snack4.id, booked: false, date: Date.today)
puts "tal => La pizza de Heba"
Booking.create(user_id: tal.id, snack_id: snack6.id, booked: false, date: Date.today)
puts "done!"


puts "----------------- Review creation ------------------"
Review.create(user_id: tal.id, snack_id: snack7.id, content: "Ils sont très croustillants et très bruyants quand ce n'est pas moi qui les mange, mais pour en avoir piqués 1 ou 2 en cachette, je confirme qu'ils sont délicieux !", rating: 5)
Review.create(user_id: diego.id, snack_id: snack1.id, content: "Merci pour la douce attention, mais y'avait un cafard dans le Twix...", rating: 1)
Review.create(user_id: heba.id, snack_id: snack6.id, content: "Je sais qu'on a pas le droit de faire ça mais c'était tellement une bonne pizza que j'étais obligée de contourner le système et de me laisser ma propre note...", rating: 5)

puts "Finished"
