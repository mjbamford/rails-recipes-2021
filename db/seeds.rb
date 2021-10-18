require 'faker'

=begin
This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)
=end

if Recipe.count == 0
    1000.times do
        # self?? What is it's ancestory chain to find `rand`?
        Recipe.create! name: Faker::Food.dish, difficulty: (rand(5) + 1)
    end
end

if Author.count ==0
    10.times do
        Author.create! name: Faker::Name.name, email: Faker::Internet.email
    end
end