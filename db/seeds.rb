# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generate 10 users

Recipient.destroy_all
UserSong.destroy_all
Song.destroy_all
Category.destroy_all
Capsule.destroy_all
User.destroy_all


puts "generating Users..."

  10.times do {
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{Faker::Name.first_name}@gmail.com"
  username = Faker::Games::Pokemon.name.strip
  password = '123456'
  user = User.new(name:)

}
