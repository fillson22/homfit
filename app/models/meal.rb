class Meal < ApplicationRecord
include RansackOptions

  belongs_to :user
  belongs_to :dish
  enum status: [ :'Перекус', :'Завтрак', :'Обед', :'Ужин' ]

  validates :dish_weight, presence: true

  def pfcc_meal(meal) # Считает бжу за один приём пищи
    proteins = (meal.dish.proteins/100*meal.dish_weight).round(2)
    fats = (meal.dish.fats/100*meal.dish_weight).round(2)
    carbohydrates = (meal.dish.carbohydrates/100*meal.dish_weight).round(2)
    cal = meal.dish.cal/100*meal.dish_weight
    return proteins, fats, carbohydrates, cal
  end

  def self.pfcc_meal_total(some_date) # Считает бжу за все приёмы пищи за конкретный период
    proteins, fats, carbohydrates, cal = 0, 0, 0, 0, 0
    Meal.where(some_date).each do |meal|
      proteins += meal.dish.proteins/100*meal.dish_weight
      fats += (meal.dish.fats/100*meal.dish_weight)
      carbohydrates += meal.dish.carbohydrates/100*meal.dish_weight
      cal += meal.dish.cal/100*meal.dish_weight
    end
    return proteins.round(2), fats.round(2), carbohydrates.round(2), cal.round(2)
  end

  def self.rezult_color(person_characteristic, pfcc_meal_total_day)
    rezult = person_characteristic <=> pfcc_meal_total_day
    rezult == 1 ? (return 'danger') : (return 'success')
  end

  def self.rezult_message(person_characteristic, pfcc_meal_total_day)
    rezult = person_characteristic <=> pfcc_meal_total_day
    rezult == 1 ? (return 'недобор') : (return 'достаточно')
  end

end
