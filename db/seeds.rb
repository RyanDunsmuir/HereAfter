# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generate 10 users

Recipient.destroy_all
UserBadge.destroy_all
Capsule.destroy_all
Category.destroy_all
User.destroy_all
Badge.destroy_all


puts "Generating 10 Users..."

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{Faker::Name.first_name}@gmail.com"
  username = Faker::Games::Pokemon.name.strip
  password = '123456'
  user = User.new(first_name: first_name, last_name: last_name, email: email, username: username, password: password )
  user.save
  print "#{username}" + "#{User.all.count == 11 ? '.' : ', '}"
end

puts "Generating categories..."

categories = %w[Birthday NewYears Wedding Graduation Confession Anniversary Festival Prediction]

categories.each do |category|
  new_category = Category.new(name: category)
  new_category.save
  print "#{category}" + "#{Category.all.count == 9 ? '.' : ', '}"
end

puts "Generating 3 Past Capsules for each User..."

User.all.each do |user|
  3.times do
    users = User.all
    users.to_a.delete_at(user.id - 1)

    time_rand_past = Time.at(0.0 + rand * (Time.now.to_f - 0.0))

    arrival_date = time_rand_past
    categories = Category.all
    receiver = users.sample
    message = Faker::Quote.famous_last_words

    new_capsule = Capsule.create(owner: user, category: categories.sample, arrival_date: arrival_date, message: message, title: Faker::Book.title)
    Recipient.create(capsule: new_capsule, user: receiver)
  end
end

puts "Generating 3 Future Capsules for each User..."

User.all.each do |user|
  3.times do
    users = User.all
    users.to_a.delete_at(user.id - 1)

    arrival_date = Time.at(Time.now + rand * (4776749101.57795 - Time.now.to_f))

    categories = Category.all
    receiver = users.sample
    message = Faker::Quote.famous_last_words

    new_capsule = Capsule.create(owner: user, category: categories.sample, arrival_date: arrival_date, message: message, title: Faker::Book.title)
    Recipient.create(capsule: new_capsule, user: receiver)
  end
end

puts "Creating a few badges..."


Badge.create(
  title: "Level 1",
  hint: "Start sending capsules",
  description: "You've sent your first capsule!",
  image_url: "http://2.bp.blogspot.com/_V_DAVEZE8qg/TLVEy0ePIeI/AAAAAAAAHPI/Y55mpN0wRkw/s400/supermayor_big.png"
  )

Badge.create(
  title: "Level 5",
  hint: "Keep sending capsules",
  description: "You've sent enough capsules to become a Time Traveller Adventurer now!",
  image_url: "http://2.bp.blogspot.com/_V_DAVEZE8qg/TLVEy0ePIeI/AAAAAAAAHPI/Y55mpN0wRkw/s400/supermayor_big.png"
  )

Badge.create(
  title: "Level 10",
  hint: "Keep sending capsules",
  description: "You've sent enough capsules to become a Time Traveller Master now!",
  image_url: "http://2.bp.blogspot.com/_V_DAVEZE8qg/TLVEy0ePIeI/AAAAAAAAHPI/Y55mpN0wRkw/s400/supermayor_big.png"
  )

puts "All Done!"
