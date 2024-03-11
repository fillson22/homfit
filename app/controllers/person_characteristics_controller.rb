class PersonCharacteristicsController < ApplicationController
  before_action :set_person_characteristic, only: [:show, :destroy, :edit, :update]

  def new
      @person_characteristic = current_user.person_characteristics.new if current_user.person_characteristics.empty?
  end

  def create
    @person_characteristic = current_user.person_characteristics.create person_characteristic_params
    if @person_characteristic.save
      redirect_to meals_path
    end
  end

  def edit; end

  def update
    @person_characteristic.update person_characteristic_params
    redirect_to meals_path
  end

  private

  def set_person_characteristic
    @person_characteristic = PersonCharacteristic.find(params[:id])
  end

  def person_characteristic_params
    params.require(:person_characteristic).permit(:genus, :age, :height, :weight, :kof_activ)
  end
end