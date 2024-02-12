class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :dish
  enum status: [ :'Перекус', :'Завтрак', :'Обед', :'Ужин' ]

  validates :dish_weight, presence: true, numericality: true

  def self.ransackable_associations(auth_object = nil)
    ["dish", "user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "dish_id", "dish_weight", "id", "status", "updated_at", "user_id"]
  end

  def name_meal
    Dish.find(dish_id).name
  end

  def pfcc_meal(meal)
    proteins = (Dish.find(meal.dish_id).proteins/100*meal.dish_weight).round(2)
    fats = (Dish.find(meal.dish_id).fats/100*meal.dish_weight).round(2)
    carbohydrates = (Dish.find(meal.dish_id).carbohydrates/100*meal.dish_weight).round(2)
    cal = (Dish.find(meal.dish_id).cal/100*meal.dish_weight).round(2)
    return proteins, fats, carbohydrates, cal
  end

  def self.pfcc_meal_total(some_date)
    weight, proteins, fats, carbohydrates, cal = 0, 0, 0, 0, 0
    Meal.where(some_date).each do |meal|
      weight += meal.dish_weight
      proteins += Dish.find(meal.dish_id).proteins/100*meal.dish_weight
      fats += (Dish.find(meal.dish_id).fats/100*meal.dish_weight)
      carbohydrates += Dish.find(meal.dish_id).carbohydrates/100*meal.dish_weight
      cal += Dish.find(meal.dish_id).cal/100*meal.dish_weight
    end
    return weight.round(2), proteins.round(2), fats.round(2), carbohydrates.round(2), cal.round(2)
  end

  def self.pfcc_total_day
    weight, proteins, fats, carbohydrates, cal = 0, 0, 0, 0, 0
    Meal.where("created_at >= ?", Time.zone.now.beginning_of_day).each do |meal|
      weight += meal.dish_weight
      proteins += Dish.find(meal.dish_id).proteins/100*meal.dish_weight
      fats += (Dish.find(meal.dish_id).fats/100*meal.dish_weight)
      carbohydrates += Dish.find(meal.dish_id).carbohydrates/100*meal.dish_weight
      cal += Dish.find(meal.dish_id).cal/100*meal.dish_weight
    end
    return weight.round(2), proteins.round(2), fats.round(2), carbohydrates.round(2), cal.round(2)
  end

end
