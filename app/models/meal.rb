class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  enum status: { snack: 0, breakfast: 1, lunch: 2, dinner: 3 }

  def meal_pfcc(dish_meal)
    proteins = (Dish.find(dish_meal.dish_id).proteins/100*dish_meal.dish_weight).round(2)
    fats = (Dish.find(dish_meal.dish_id).fats/100*dish_meal.dish_weight).round(2)
    carbohydrates = (Dish.find(dish_meal.dish_id).carbohydrates/100*dish_meal.dish_weight).round(2)
    cal = (Dish.find(dish_meal.dish_id).cal/100*dish_meal.dish_weight).round(2)
    return proteins, fats, carbohydrates, cal
  end

end
