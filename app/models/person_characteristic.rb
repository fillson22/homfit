class PersonCharacteristic < ApplicationRecord
  belongs_to :user
  validates :genus, :age, :height, :weight, :kof_activ, presence: true, numericality: true

  def norm_kkal
    if genus == 0
      norm_kkal = ((10*weight)+(6.25*height)-(5*age)+5)*kof_activ
    else
      norm_kkal = ((10*weight)+(6.25*height)-(5*age)-161)*kof_activ
    end
  end
end
