  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generate 10 users

avatar_photos = %w(https://i.ibb.co/SQHfQCN/Avatar-75.jpg
https://i.ibb.co/tYbw0LB/Avatar-1.jpg
https://i.ibb.co/5RL202L/Avatar-2.jpg
https://i.ibb.co/JdtNpy9/Avatar-3.jpg
https://i.ibb.co/G0SmWZY/Avatar-4.jpg
https://i.ibb.co/wWwxzQY/Avatar-5.jpg
https://i.ibb.co/1sZJ5Yg/Avatar-6.jpg
https://i.ibb.co/VWhxDd6/Avatar-7.jpg
https://i.ibb.co/9VLNf3F/Avatar-8.jpg
https://i.ibb.co/Z27pWZV/Avatar-9.jpg
https://i.ibb.co/84y3hjw/Avatar-10.jpg
https://i.ibb.co/mTzhkxv/Avatar-11.jpg
https://i.ibb.co/d0TMhmF/Avatar-12.jpg
https://i.ibb.co/PDPLSpr/Avatar-13.jpg
https://i.ibb.co/bzhrfSR/Avatar-14.jpg
https://i.ibb.co/G5mYt8z/Avatar-15.jpg
https://i.ibb.co/FbWV8W3/Avatar-16.jpg
https://i.ibb.co/HrcS26j/Avatar-17.jpg
https://i.ibb.co/xJp36P1/Avatar-18.jpg
https://i.ibb.co/f2pjZrN/Avatar-19.jpg
https://i.ibb.co/BytCtrf/Avatar-20.jpg
https://i.ibb.co/4pD1rGV/Avatar-21.jpg
https://i.ibb.co/Sw5cr6C/Avatar-22.jpg
https://i.ibb.co/59WTYzH/Avatar-23.jpg
https://i.ibb.co/WFNfQXd/Avatar-24.jpg
https://i.ibb.co/ftHMTBg/Avatar-25.jpg
https://i.ibb.co/TctW9v2/Avatar-26.jpg
https://i.ibb.co/D84DTkW/Avatar-27.jpg
https://i.ibb.co/4RF6QyV/Avatar-28.jpg
https://i.ibb.co/F4j3cSd/Avatar-29.jpg
https://i.ibb.co/y5kMcqk/Avatar-30.jpg
https://i.ibb.co/P43YHGJ/Avatar-31.jpg
https://i.ibb.co/LxWpRQy/Avatar-32.jpg
https://i.ibb.co/dW75pNP/Avatar-33.jpg
https://i.ibb.co/4W94ZC2/Avatar-34.jpg
https://i.ibb.co/pXfHDMX/Avatar-35.jpg
https://i.ibb.co/z4XF5SL/Avatar-36.jpg
https://i.ibb.co/KXXDTXR/Avatar-37.jpg
https://i.ibb.co/pf5pGy9/Avatar-38.jpg
https://i.ibb.co/DPFJ3P7/Avatar-39.jpg
https://i.ibb.co/qyzjcPB/Avatar-40.jpg
https://i.ibb.co/kmhJQvr/Avatar-41.jpg
https://i.ibb.co/g4CbfR2/Avatar-42.jpg
https://i.ibb.co/9bkMLH8/Avatar-43.jpg
https://i.ibb.co/djPLfDC/Avatar-44.jpg
https://i.ibb.co/Q6b9pJs/Avatar-45.jpg
https://i.ibb.co/RvbjHbv/Avatar-46.jpg
https://i.ibb.co/ZL0s8SK/Avatar-47.jpg
https://i.ibb.co/ZJHHS0h/Avatar-48.jpg
https://i.ibb.co/W072C56/Avatar-49.jpg
https://i.ibb.co/GRcy9P9/Avatar-50.jpg
https://i.ibb.co/mrpWYqc/Avatar-51.jpg
https://i.ibb.co/C5x1JN6/Avatar-52.jpg
https://i.ibb.co/bdKdYPY/Avatar-53.jpg
https://i.ibb.co/h14dnh9/Avatar-54.jpg
https://i.ibb.co/4fH8Skt/Avatar-55.jpg
https://i.ibb.co/vkS38B8/Avatar-56.jpg
https://i.ibb.co/mHwPmS4/Avatar-57.jpg
https://i.ibb.co/nnhRSyz/Avatar-58.jpg
https://i.ibb.co/chdcDVs/Avatar-59.jpg
https://i.ibb.co/6JWpx08/Avatar-60.jpg
https://i.ibb.co/XbPk93J/Avatar-61.jpg
https://i.ibb.co/YbHfj6t/Avatar-62.jpg
https://i.ibb.co/dpJk9hr/Avatar-63.jpg
https://i.ibb.co/HFk9wgg/Avatar-64.jpg
https://i.ibb.co/vcSw1S5/Avatar-65.jpg
https://i.ibb.co/PCJFrfB/Avatar-66.jpg
https://i.ibb.co/0cjDvPR/Avatar-67.jpg
https://i.ibb.co/3kh669B/Avatar-68.jpg
https://i.ibb.co/8XFyCcZ/Avatar-69.jpg
https://i.ibb.co/qswcFyw/Avatar-70.jpg
https://i.ibb.co/4Z0r4qm/Avatar-71.jpg
https://i.ibb.co/gM2QJQw/Avatar-72.jpg
https://i.ibb.co/tHdgKYx/Avatar-73.jpg
https://i.ibb.co/WK818GG/Avatar-74.jpg
https://i.ibb.co/2Y6HpNq/Avatar-78.jpg
https://i.ibb.co/7QXG8GD/Avatar-76.jpg
https://i.ibb.co/MpZCVbH/Avatar-77.jpg)


Recipient.destroy_all
UserBadge.destroy_all
Capsule.destroy_all
Category.destroy_all
User.destroy_all
Badge.destroy_all


puts "Generating 15 Users..."

15.times do
  avatar_photos.shuffle
  avatar = avatar_photos.pop
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = "#{first_name}@gmail.com"
  username = Faker::Games::Pokemon.name.strip
  password = '123456'
  user = User.new(first_name: first_name, last_name: last_name, email: email, username: username, password: password, avatar_photo: avatar )
  user.save
  print "#{username}" + "#{User.all.count == 11 ? '.' : ', '}"
end

puts "Generating categories..."

categories = %w[General Birthday Confession Prediction]

categories.each do |category|
  new_category = Category.new(name: category)
  new_category.save
  print "#{category}" + "#{Category.all.count == 9 ? '.' : ', '}"
end

puts "Generating 5 Past Capsules for each User..."

User.all.each do |user|
  5.times do
    users = User.all
    users.to_a.delete_at(user.id - 1)

    time_rand_past = Time.at(0.0 + rand * (Time.now.to_f - 0.0))

    arrival_date = time_rand_past
    categories = Category.all
    receiver = users.sample
    message = Faker::Quote.famous_last_words

    new_capsule = Capsule.create(owner: user, category: categories.sample, arrival_date: arrival_date, message: message, title: Faker::Book.title)
    Recipient.create(capsule: new_capsule, user: receiver)
    new_capsule.update(created_at: time_rand_past - (rand(1..10000).days))
  end
end

puts "Generating 5 Future Capsules for each User..."

User.all.each do |user|
  5.times do
    users = User.all
    users.to_a.delete_at(user.id - 1)

    arrival_date = Time.at(Time.now + rand * (4776749101.57795 - Time.now.to_f))

    categories = Category.all
    receiver = users.sample
    message = Faker::Quote.famous_last_words

    new_capsule = Capsule.create(owner: user, category: categories.sample, arrival_date: arrival_date, message: message, title: Faker::Book.title)
    Recipient.create(capsule: new_capsule, user: receiver)
    new_capsule.update(created_at: Time.now - (rand(1..400).days))
  end
end

puts "Creating a few badges..."


Badge.create(
  title: "Level 1",
  hint: "Start sending capsules",
  description: "Congrats on your first capsule! You are now a Time Traveller Rookie!",
  image_url: "https://lh3.googleusercontent.com/0lYOpzNuaSOIfiGFoDrQpHOMRY9DoRMoIaDarWgTttInRXqEx8dk6Vp35d1XIQE6Xefv1ioX3nxNRmgn_GtLle4hwT4znTDZlfykYjc3g_KDAo79PEHey7Q-cLSg-ExGurvwEHxeug=w800"
  )

Badge.create(
  title: "Level 5",
  hint: "Send more capsules",
  description: "Time travelling is becoming your routine... You are now a Time Traveller Adventurer!",
  image_url: "https://lh3.googleusercontent.com/RMDJi0D_fbY0eUisaBIF3GkDoEFoLoHCNyucXWC3bz_Vkz73o5N_Img9oK7xDAsQfPE5O_MBoGQpRT37vhYXXeciSnV_ESl9LvTbdd7JqSt4j39fOl8gwd3LZ2KCuuhjVZtyQp4AFQ=w800"
  )

Badge.create(
  title: "Level 10",
  hint: "Keep sending capsules",
  description: "You've sent enough capsules to become a Time Traveller Master! Go brag to your friends about it.",
  image_url: "https://lh3.googleusercontent.com/2fOje84e28DU8cz4k7k4M8BhG7Jt3VTkRsqblcEmzx4OTPyKS1OCaXap3800EkAUXnEyjE4Fe_IW2nsjz8WZecRZimYlBTbAFzGHXRJXwUdyzqme8YY8G-VLuC6Lf0V4KNtXeN-pPg=w800"
  )

Badge.create(
  title: "Level 15",
  hint: "Keep doing what you're doing son",
  description: "Your time travelling abilities are comparable to Seb-Jesus' coding abilities, you've become a Time Traveller Grandmaster now! A title very few possess...",
  image_url: "https://lh3.googleusercontent.com/tcQsBSNpoCM9ElEcxtRmtsBywBBinmkSn4Zaph76e58iMdFt9ZWnHOSXkC5tER0bhJSsGqlBS9fuCib2CQykdlYZhd4xhkhoyEHmduEufbgFb8STUozMAoFtOzgbyt4IU5lwbvCqsA=w800"
  )

Badge.create(
  title: "Birthday",
  hint: "Who's birthday is it today?",
  description: "You sent someone a Birthday capsule to celebrate the day they were born!",
  image_url: "https://lh3.googleusercontent.com/_oaN_wXk6FV8URjijtMGUQj0ExP6SH6X3a-zfwOHdZP-QIyCN9_pF4JP_fdwvb2K_Svh4UG71Hcdr5GmKBT3JeOSzm1lOGbwD_JlWcg-KbjLa5xEDeqOkI65cBVLcoP2cOy-REwHQg=w800"
  )

Badge.create(
  title: "Confession",
  hint: "Anything you need to get off your chest?",
  description: "Well done for confessing, it is never easy to own upto the things we have done. Give it some time and you will know you did the right thing!",
  image_url: "https://lh3.googleusercontent.com/GtObGGv-u1mTJ1AkznQZ3hr73SaSHoZj_WjhRe0ElDQV3vi0yZot01XBaU4VpVFVSfkfjQ0UjECUuZRcJy14kwkLenXKU207a2xpT05UHtT2gYTVNfPUlTKmWDv6v-9gsMpZLNDelA=w800"
  )

Badge.create(
  title: "Prediction",
  hint: "Can you predict the future?",
  description: "What will the future hold? Who can truly know? Apparently you can! Let's see if what you predicted will become reality...",
  image_url: "https://lh3.googleusercontent.com/apED0yA57sLA3oj5eg3mzPfeSe-nMRGimWKHuCFUcHnRmGmAJhl5vOJ4OnuE9q1_v3idmQbFuX8OEWrK7WKn6SSKZK-BVCkNRKl4hVZp2pA_5uWBkdZwexhVCeAuyJb3AhWMrOKZ2Q=w800"
  )

Badge.create(
  title: "Midnight",
  hint: "Are you a creature of the night?",
  description: "What will the future hold? Who can truly know? Apparently you can! Let's see if what you predicted will become reality...",
  image_url: "https://lh3.googleusercontent.com/njFwm-iZlaE9_lkYSttKkSwrw1ZyAWApVwCu40U80-tRt0f5nJDsu0gcYfRZFPF4vXbwtnxmEgjDmOf93X9uIKEMOe7tASlsi5EIVKYKRwHLRrh9_GpczXBwT3Zr-dctbz-wo1x0-A=w800"
  )


puts "All Done!"
