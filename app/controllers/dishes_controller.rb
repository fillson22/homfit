class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :destroy, :edit, :update]

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.create dish_params
    if @dish.save
      redirect_to dishes_path, notice: 'Блюдо добавлено'
    end
  end

  def index
    @pagy, @dishes = pagy(Dish.all.order(created_at: :desc), items: 5)
  end

  def show; end

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end

  def edit; end

  def update
    @dish.update dish_params
    redirect_to dishes_path
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:name, :proteins, :fats, :carbohydrates, :cal)
  end
end
