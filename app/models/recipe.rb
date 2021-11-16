class Recipe < ApplicationRecord
    belongs_to :author
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :comments, as: :commentable
    has_one_attached :image
    has_many :transactions
    has_many :logs, as: :loggable

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :difficulty, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

    accepts_nested_attributes_for :comments

    scope :very_difficult, -> { where(difficulty: 5) }
    scope :sold, -> { joins(:transactions) }

    after_create :log_create
    after_update :log_update

    def to_s
        "Recipe #{id}; #{name}, #{difficulty}"
    end

    def log_create
        logs.create! body: 'Created!'
    end

    def log_update
        logs.create! body: 'Updated!'
    end
end
