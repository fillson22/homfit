class DishesController < ApplicationController

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.create dish_create_params
    if @dish.save
      redirect_to dishes_path
    end
  end

  def index
    @dishes = Dish.all.order created_at: :desc
  end

  def destroy
    @dish = Dish.find(params[:id])
    @dish.destroy
    redirect_to dishes_path
  end

  private

  def dish_create_params
    params.require(:dish).permit(:name, :proteins, :fats, :carbohydrates, :cal)
  end
end
