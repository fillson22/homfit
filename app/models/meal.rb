class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  enum status: { snack: 0, breakfast: 1, lunch: 2, dinner: 3 }
end
