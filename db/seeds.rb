# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
    user = User.create(
        first_name: Faker::JapaneseMedia::DragonBall.character,
        last_name: Faker::JapaneseMedia::SwordArtOnline.game_name,
        description: Faker::TvShows::Friends.quote,
        email: "#{Faker::JapaneseMedia::DragonBall.character}@yopmail.com",
        password: "azerty",
        password_confirmation: "azerty")
end

10.times do
    event = Event.create(
        start_date: Faker::Date.forward(days: 23),
        duration: Faker::Number.digit,
        title: Faker::TvShows::RickAndMorty.quote,
        description: Faker::Quotes::Shakespeare.hamlet_quote,
        price: Faker::Number.within(range: 1..1000),
        location: Faker::TvShows::Friends.location,
        admin_id: User.all.sample.id)
end

10.times do
    attendance = Attendance.create(
        stripe_customer_id: Faker::Games::Pokemon.name,
        user_id: User.all.sample.id,
        event_id: Event.all.sample.id)
end

puts "Eh voila db create jeune pomme :3"