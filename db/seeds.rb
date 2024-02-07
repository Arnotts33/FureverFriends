# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Breed.destroy_all

dog1 = Breed.new(name: "German Shepherd", details: "Some details about breed", description: "Some description", picture: 'german-shepherd.jpeg')
dog1.save
dog2 = Breed.create(name: "Bernese Mountain Dog", details: "Some details about breed", description: "Some description", picture: "bernese-mountain-dog.jpg")
dog3 = Breed.create(name: "Jack Russell Terrier", details: "Some details about breed", description: "Some description", picture: "jack_russell_terrier.jpg")
dog4 = Breed.create(name: "Shiba Inu", details: "Some details about breed", description: "Some description", picture: "shiba-inu.jpg")
