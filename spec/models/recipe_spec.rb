require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "should know how to add 2 plus 2" do
    expect(2 + 2).to eq(4)
  end

  it "should respond to #name" do
    recipe = Recipe.new
    expect(recipe).to respond_to(:name)
  end

  it { is_expected.to respond_to :name }
  it { is_expected.to respond_to :difficulty }

  it "should allow assignment to #name" do
    recipe = Recipe.new
    recipe.name = "Foo"
    expect(recipe.name).to eq("Foo")
  end

  it "should allow assignment to #difficulty" do
    recipe = Recipe.new
    recipe.difficulty = 1
    expect(recipe.difficulty).to eq(1)
    recipe.difficulty = 666
    expect(recipe.difficulty).to eq(666)
    expect(recipe).not_to be_valid
  end

  context "when invalid parameters" do
    subject { Recipe.new }
    let(:recipe) { Recipe.new }

    it "should be not be valid" do
      expect(recipe).to_not be_valid # valid?
      expect(recipe.errors.full_messages).to include "Name can't be blank"

      expect(subject).to_not be_valid # valid?
      expect(subject.errors.full_messages).to include "Difficulty is not a number"
    end

    # ...
  end

  it "should coalesce into a string" do
    author = Author.create(name: "Adam Ant")
    recipe = author.recipes.create!(name: "Foo", difficulty: 1)
    expect(recipe.to_s).to match /Recipe #{recipe.id}/
  end

  it "should create a recipe in the database" do
    author = Author.create(name: "Adam Ant")
    expect { author.recipes.create!(name: "Foo", difficulty: 1) }.to change { Recipe.count }.by(1)
  end
end
