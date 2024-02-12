class Dish < ApplicationRecord
  validates :name, presence: true
  validates :proteins, :fats, :carbohydrates, numericality: true
  validates :cal, numericality: { only_integer: true }
  has_many :meals, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["meals"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["cal", "carbohydrates", "created_at", "fats", "id", "name", "proteins", "updated_at"]
  end
end
