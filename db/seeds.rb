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

puts "Destroying breeds..."

Breed.destroy_all

puts "Creating breeds..."

dog1 = {name: "German Shepherd", details: "Some details about breed", description: "Some description", score: "12", picture: "https://images.unsplash.com/photo-1607034145556-36a4aefc3b97?q=80&w=1564&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"}
dog2 = {name: "Bernese Mountain Dog", details: "Some details about breed", description: "Some description", score: "14", picture: "https://images.unsplash.com/photo-1666212565787-8cd1d0075875?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"}
dog3 = {name: "Jack Russell Terrier", details: "Some details about breed", description: "Some description", score: "20", picture: "https://images.unsplash.com/photo-1599908758973-b02eb044e5ab?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"}
dog4 = {name: "Shiba Inu", details: "Some details about breed", description: "Some description", score: "22",picture: "https://images.unsplash.com/photo-1618173745201-8e3bf8978acc?q=80&w=1530&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"}

[dog1, dog2, dog3, dog4].each do |attributes|
  file = URI.open(attributes[:picture])
  breed = Breed.new(attributes)
  breed.photo.attach(io: file, filename: "#{attributes[:name]}.png", content_type: "image/png")
  breed.save!
  puts "Created #{breed.name}"
end

puts "Destroying sellers..."

Seller.destroy_all

puts "Creating sellers..."

Seller.create(name: "Des Gerveilles", address: "26 route du Pas de Meric, 33920 Saint Yzan de Soudiac", email: "seller1@gmail.com", phone_number: "0556454647")

puts "Created sellers"
