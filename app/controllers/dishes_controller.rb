class DishesController < ApplicationController

  def new
    @dish = Dish.new
  end

  private

  def dish_create_params
    params.require(:dish).permit(:name, :proteins, :fats, :carbohydrates, :cal)
  end
end
