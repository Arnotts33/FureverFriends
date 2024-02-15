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
require "faker"

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

## 29.times do |i|
##   puts i
##   url = "https://dogapi.dog/api/v2/breeds?page[number]=#{i + 1}"
##   response = URI.open(url).read
##   dog_breeds_description = JSON.parse(response)
##
##   dog_breeds_description["data"].each do |breed_description|
##     dog_breed_name = breed_description["attributes"]["name"].split
##     dog_breed_join_name = dog_breed_name.first(2).join(" ")
##     breed_name = Breed.find_by(
##       "name ILIKE ?", "%#{dog_breed_join_name}%"
##     )
##     if breed_name
##       breed_name.description = breed_description["attributes"]["description"]
##       breed_name.save
##     end
##   end
## end

puts "Destroying sellers..."

Seller.destroy_all

puts "Creating sellers..."

bordeaux_range = { lat: 44.837789, lng: -0.57918, radius: 0.1 }
cologne_range = { lat: 50.937531, lng: 6.960279, radius: 0.1 }

def random_address_in_range(range)
  lat = range[:lat] + rand(-range[:radius]..range[:radius])
  lng = range[:lng] + rand(-range[:radius]..range[:radius])
  street = Faker::Address.street_address
end

86.times do
  name = Faker::Company.name
  email = Faker::Internet.email(name: "#{name}.dogshelter", domain: "gmail.com")
  phone_number = Faker::PhoneNumber.phone_number

  address = random_address_in_range(bordeaux_range)
  latitude = bordeaux_range[:lat] + rand(-bordeaux_range[:radius]..bordeaux_range[:radius])
  longitude = bordeaux_range[:lng] + rand(-bordeaux_range[:radius]..bordeaux_range[:radius])

  Seller.create(
    name: "#{name} Dog Shelter",
    address: address,
    email: email,
    phone_number: phone_number,
    latitude: latitude,
    longitude: longitude
  )
end

86.times do
  name = Faker::Company.name
  email = Faker::Internet.email(name: "#{name}.dogshelter", domain: "gmail.com")
  phone_number = Faker::PhoneNumber.phone_number

  address = random_address_in_range(cologne_range)
  latitude = cologne_range[:lat] + rand(-cologne_range[:radius]..cologne_range[:radius])
  longitude = cologne_range[:lng] + rand(-bordeaux_range[:radius]..cologne_range[:radius])

  Seller.create(
    name: "#{name} Dog Shelter",
    address: address,
    email: email,
    phone_number: phone_number,
    latitude: latitude,
    longitude: longitude
  )
end

puts "Created sellers"

puts "Destroying Breedsellers..."

BreedSeller.destroy_all

puts "Creating BreedSellers..."

breeds = Breed.all

sellers = Seller.all

sellers.each do |seller|
  random_breeds = breeds.sample(rand(1..3))

  random_breeds.each do |breed|
    BreedSeller.create(seller: seller, breed: breed)
  end
end

puts "Created BreedSellers"

puts "Destroying messages..."

Message.destroy_all

puts "Destroying chatrooms..."

Chatroom.destroy_all
