class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :meals, dependent: :destroy
  has_many :person_characteristic, dependent: :destroy
end
