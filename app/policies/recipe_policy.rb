class RecipePolicy < ApplicationPolicy
    def edit?
        user.admin? || user.id == record.author.user_id
    end

    def update?
        edit?
    end
  end