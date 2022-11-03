require 'faker'


10.times do	
	City.create(name: Faker::Address.city, zip_code: Faker::Address.zip)
end

10.times do
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, mail: Faker::Internet.email, age: rand(18..99), city_id: rand(1..10))
end


20.times do |i|
  Gossip.create(
    title: Faker::Movie.title[0..11],
    content: Faker::Quote.matz,
    user: User.all.sample,
  )
end
10.times do
  title = Faker::Dessert.variety.strip.downcase
  title.gsub!(/\s+/, '-')
  Tag.create(
    title: title,
  )
end