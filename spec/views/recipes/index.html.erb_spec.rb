require 'rails_helper'

RSpec.describe "recipes/index", type: :view do
  let(:author) { Author.create! name: 'Adam Ant' }

  before(:each) do
    assign(:recipes, [
      author.recipes.create!(name: 'Cake', difficulty: 3),
      author.recipes.create!(name: 'Toast', difficulty: 1)
    ])
  end

  it "renders a list of recipes" do
    render
    # raise rendered.inspect
    expect(rendered).to match /Cake/
    expect(rendered).to match /Toast/
    assert_select "tr>td", text: 'Cake', count: 1
    assert_select "tbody>tr", count: 2
  end
end
