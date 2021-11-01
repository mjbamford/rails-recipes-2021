require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  let(:author) { Author.create! name: 'Adam Ant' }

  xit "renders a list of recipes" do
    assign(:recipes, [
      author.recipes.create!(name: 'Cake', difficulty: 3)
    ])
  end
end
