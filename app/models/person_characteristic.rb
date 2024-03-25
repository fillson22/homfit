class PersonCharacteristic < ApplicationRecord
  belongs_to :user
  validates :genus, :age, :height, :weight, :kof_activ, presence: true, numericality: true

  def norm_pfc
    if genus == 0
      norm_kkal = ((10*weight)+(6.25*height)-(5*age)+5)*kof_activ
    else
      norm_kkal = ((10*weight)+(6.25*height)-(5*age)-161)*kof_activ
    end
    norm_proteins = (0.3*norm_kkal)/4
    norm_fats = (0.3*norm_kkal)/9
    norm_carbohydrates = (0.4*norm_kkal)/4
    return norm_proteins.round(2), norm_fats.round(2), norm_carbohydrates.round(2), norm_kkal.round(2) 
  end

end
