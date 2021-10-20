require 'faker'

=begin
This file should contain all the record creation needed to seed the database with its default values.
The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Examples:

  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
  Character.create(name: 'Luke', movie: movies.first)
=end

if Rails.env.development?
    if Author.count ==0
        3.times do
            Author.create! name: Faker::Name.name, email: Faker::Internet.email
        end
    end

    if Recipe.count == 0
        author_ids = Author.pluck(:id)
        21.times do
            author = Author.find author_ids.sample
            author.recipes.create! name: Faker::Food.dish, difficulty: (rand(5) + 1)
        end
    end

    if Ingredient.count == 0
        21.times do
            Ingredient.create! name: Faker::Food.ingredient
        end
    end

    if RecipeIngredient.count == 0
        ingredient_ids = Ingredient.pluck(:id)

        Recipe.all.each do |recipe|
            (rand(5)+1).times do
                recipe.ingredients << (Ingredient.find ingredient_ids.sample)
            end
        end
    end
end