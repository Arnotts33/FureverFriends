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
require "json"

puts "Destroying breeds..."

Breed.destroy_all

puts "Creating breeds..."

def fetch_breeds(api_key)
  url = 'https://api.thedogapi.com/v1/breeds'
  uri = URI(url)
  request = Net::HTTP::Get.new(uri)
  request['x-api-key'] = api_key
  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == 'https') do |http|
    http.request(request)
  end

  JSON.parse(response.body)
end

api_key = 'live_0AfDe15VM9btdrP2wi30pN5xRExI09KEJpymMSJy8f6KS9wEp4mSJGfJcgEnuUoj'

dog_breeds_data = fetch_breeds(api_key)

dog_breeds_data.each do |breed_data|
  Breed.create!(
    name: breed_data['name'],
    description: breed_data['temperament'],
    lifespan: breed_data['life_span'],
    weight: breed_data['weight']['imperial'],
    score: rand(1..20),
    picture: breed_data['image']['url']
  )
end

29.times do |i|
  url = "https://dogapi.dog/api/v2/breeds?page[number]=#{i + 1}"
  response = URI.open(url).read
  dog_breeds_description = JSON.parse(response)

  dog_breeds_description["data"].each do |breed_description|
    dog_breed_name = breed_description["attributes"]["name"].split
    dog_breed_join_name = dog_breed_name.first(2).join(" ")
    breed_name = Breed.find_by(
      "name ILIKE ?", "%#{dog_breed_join_name}%"
    )
    if breed_name
      breed_name.description = breed_description["attributes"]["description"]
      breed_name.save
    end
  end
end


## dog_breeds = [
##   { name: 'Labrador Retriever', description: 'Friendly, outgoing, and high-spirited.', lifespan: '10-12 years', weight: '55-80 pounds', score: "12", picture: "https://images.unsplash.com/photo-1623052940978-051d2c0fb4be?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D" },
##
## ]
##
## dog_breeds.each do |attributes|
##   file = URI.open(attributes[:picture])
##   breed = Breed.new(attributes)
##   breed.photo.attach(io: file, filename: "#{attributes[:name]}.png", content_type: "image/png")
##   breed.save!
##   puts "Created #{breed.name}"
## end

puts "Destroying sellers..."

Seller.destroy_all

puts "Creating sellers..."

Seller.create(name: "Des Gerveilles", address: "26 route du Pas de Meric, 33920 Saint Yzan de Soudiac", email: "seller1@gmail.com", phone_number: "0556454647")

puts "Created sellers"

puts "Destroying chatrooms..."

Chatroom.destroy_all
