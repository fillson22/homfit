class MealsController < ApplicationController

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create meal_params
    if @meal.save
      redirect_to meals_path
    end
  end

  def index
    @meals = Meal.all.order created_at: :desc
  end

  private

  def meal_params
    params.require(:meal).permit(:dish_id, :dish_weight, :status).merge(user_id: current_user.id)
  end


end