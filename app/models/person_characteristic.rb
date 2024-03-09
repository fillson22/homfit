class PersonCharacteristic < ApplicationRecord
  belongs_to :user
  validates :genus, :age, :height, :weight, :kof_activ, presence: true, numericality: true
end
