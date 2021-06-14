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
  email = "#{first_name}@gmail.com"
  username = Faker::Games::Pokemon.name.strip
  password = '123456'
  user = User.new(first_name: first_name, last_name: last_name, email: email, username: username, password: password )
  user.save
  print "#{username}" + "#{User.all.count == 11 ? '.' : ', '}"
end

puts "Generating categories..."

categories = %w[General Birthday NewYears Wedding Graduation Confession Anniversary Festival Prediction Inheritance]

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
  description: "Congrats on your first capsule! You are now a Time Traveller Rookie!",
  image_url: "https://lh3.googleusercontent.com/0lYOpzNuaSOIfiGFoDrQpHOMRY9DoRMoIaDarWgTttInRXqEx8dk6Vp35d1XIQE6Xefv1ioX3nxNRmgn_GtLle4hwT4znTDZlfykYjc3g_KDAo79PEHey7Q-cLSg-ExGurvwEHxeug=w2400"
  )

Badge.create(
  title: "Level 5",
  hint: "Send more capsules",
  description: "Time travelling is becoming your routine... You are now a Time Traveller Adventurer!",
  image_url: "https://lh3.googleusercontent.com/RMDJi0D_fbY0eUisaBIF3GkDoEFoLoHCNyucXWC3bz_Vkz73o5N_Img9oK7xDAsQfPE5O_MBoGQpRT37vhYXXeciSnV_ESl9LvTbdd7JqSt4j39fOl8gwd3LZ2KCuuhjVZtyQp4AFQ=w2400"
  )

Badge.create(
  title: "Level 10",
  hint: "Keep sending capsules",
  description: "You've sent enough capsules to become a Time Traveller Master! Go brag to your friends about it.",
  image_url: "https://lh3.googleusercontent.com/2fOje84e28DU8cz4k7k4M8BhG7Jt3VTkRsqblcEmzx4OTPyKS1OCaXap3800EkAUXnEyjE4Fe_IW2nsjz8WZecRZimYlBTbAFzGHXRJXwUdyzqme8YY8G-VLuC6Lf0V4KNtXeN-pPg=w2400"
  )

Badge.create(
  title: "Level 15",
  hint: "Keep doing what you're doing son",
  description: "Your time travelling abilities are comparable to Seb-Jesus' coding abilities, you've become a Time Traveller Grandmaster now! A title very few possess...",
  image_url: "https://lh3.googleusercontent.com/tcQsBSNpoCM9ElEcxtRmtsBywBBinmkSn4Zaph76e58iMdFt9ZWnHOSXkC5tER0bhJSsGqlBS9fuCib2CQykdlYZhd4xhkhoyEHmduEufbgFb8STUozMAoFtOzgbyt4IU5lwbvCqsA=w2400"
  )


puts "All Done!"
