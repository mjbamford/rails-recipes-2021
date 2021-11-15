class User < ApplicationRecord
  has_one :author
  accepts_nested_attributes_for :author

  has_many :purchases, class_name: 'Transaction', foreign_key: 'buyer_id'
  has_many :sales, class_name: 'Transaction', foreign_key: 'seller_id'

  has_many :purchased_recipes, through: :purchases, source: :recipe
  has_many :sold_recipes, through: :sales, source: :recipe

  scope :sellers, -> { distinct.joins(:sales) }
  scope :buyers, -> { distinct.joins(:purchases) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise \
    :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable,
    :trackable,
    :timeoutable, timeout_in: 30.minutes

  def admin?; false; end
end
