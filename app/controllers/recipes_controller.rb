class RecipesController < ApplicationController
    def index
        @messages = %w[ one two three foru five six seven eight ]
    end
end