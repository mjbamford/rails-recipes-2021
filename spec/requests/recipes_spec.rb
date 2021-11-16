require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  context "when logged in" do
    let(:user) { 
      User.create! \
        email: 'test@example.com', 
        password: 'Password1',
        password_confirmation: 'Password1',
        author_attributes: { name: 'MacTester' }
    }

    before(:each) do
      sign_in user
    end

    describe "GET /recipes" do
      it "should have http status 200 OK" do
        get recipes_path
        expect(response).to have_http_status 200
        expect(response).to be_successful
      end
    end

    describe "POST /recipes" do
      let!(:author) { Author.create name: 'Adam Ant' }
      let(:valid_attrs) {{ name: 'Toast', author_id: author.id, difficulty: "1" }}

      context "with valid params" do
        it "creates a new recipe" do
          expect {
            post recipes_path, params: { recipe: valid_attrs }
          }.to change(Recipe, :count).by(1)
        end

        it "redirects to the created recipe" do
            post recipes_path, params: { recipe: valid_attrs }
            expect(response).to have_http_status 302
            expect(response).to redirect_to(recipe_path(Recipe.last))
            expect(response).to redirect_to(recipe_url(Recipe.last))
            expect(response).to redirect_to(Recipe.last)
        end
      end

      context "with invalid params" do
        it "does not create a new recipe" do
          # Don't need this line below since I'm forcing the creaetion of the
          # author with the `let!` declaration above.
          # Author.create! name: 'Adam Ant'
          expect {
            post recipes_path, params: { recipe: { name: '' } }
          }.not_to change(Recipe, :count)
        end
      end
    end
  end
end
