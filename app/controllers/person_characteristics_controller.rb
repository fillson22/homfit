class PersonCharacteristicsController < ApplicationController

  def new
    @person_characteristic = current_user.person_characteristic.new
  end

  def create
    @person_characteristic = current_user.person_characteristic.create person_characteristic_params
    if @person_characteristic.save
      redirect_to meals_path
    end
  end

  private

  def person_characteristic_params
    params.require(:person_characteristic).permit(:genus, :age, :height, :weight, :kof_activ)
  end
end