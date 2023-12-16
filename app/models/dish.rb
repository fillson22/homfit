class Dish < ApplicationRecord
  validates :name, presence: true
  validates :proteins, :fats, :carbohydrates, numericality: true
  validates :cal, numericality: { only_integer: true }
  has_many :meals
end
