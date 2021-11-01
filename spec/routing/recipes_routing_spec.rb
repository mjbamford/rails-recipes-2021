require "rails_helper"

RSpec.describe "Recipes routing", type: :routing do
  it "routes /recipes/new to the Recipes controller" do
    expect(get("/recipes/new")).to route_to "recipes#new"
    expect(get: "/recipes/new").to route_to "recipes#new"
  end

  it "routes post /recipes to the Recipes controller" do
    expect(post("/recipes")).to route_to "recipes#create"
    expect(post: "/recipes").to route_to "recipes#create"
  end

  it "routes /recipes/:id to the Recipes controller" do
    expect(get("/recipes/1")).to route_to "recipes#show", id: "1"
    expect(get: "/recipes/1").to route_to "recipes#show", id: "1"
  end

  it "routes '/' to Recipes index" do
    expect(get("/")).to route_to "recipes#index"
    expect(get: "/").to route_to "recipes#index"
  end
end