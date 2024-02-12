class MealsController < ApplicationController
  before_action :set_meal, only: [:destroy, :edit, :update]

  def new
    @meal = current_user.meals.new
  end

  def create
    @meal = current_user.meals.create meal_params
    if @meal.save
      redirect_to meals_path
    end
  end

  def index
    @meals = current_user.meals.all.order created_at: :desc
  end

  def destroy
    @meal.destroy
    redirect_to meals_path
  end

  def edit; end

  def update
    @meal.update meal_params
    redirect_to meals_path
  end

  def report
    @q = current_user.meals.ransack(params[:q])
    @meals = @q.result.includes(:dish)
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:dish_id, :dish_weight, :status)
  end


end