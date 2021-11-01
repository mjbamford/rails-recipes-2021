require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "should know how to add 2 plus 2" do
    expect(2 + 2).to eq(4)
  end

  it "should respond to #name" do
    recipe = Recipe.new
    expect(recipe).to respond_to(:name)
  end

  it "should allow assignment to #name" do
    recipe = Recipe.new
    recipe.name = "Foo"
    expect(recipe.name).to eq("Foo")
  end

  it "should allow assignment to #difficulty" do
    recipe = Recipe.new
    recipe.difficulty = 1
    expect(recipe.difficulty).to eq(1)
  end
end
