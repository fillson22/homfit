class MealsController < ApplicationController

  def new
    @meal = current_user.meals.new
  end

  def create
    @meal = current_user.meals.create meal_params
    if @meal.save
      redirect_to new_meal_path
    end
  end

  def index
    @meals = current_user.meals.all.order created_at: :desc
  end

  private

  def meal_params
    params.require(:meal).permit(:dish_id, :dish_weight, :status)
  end


end