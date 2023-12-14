class CreateDishes < ActiveRecord::Migration[7.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.float :proteins
      t.float :fats
      t.float :carbohydrates
      t.integer :cal

      t.timestamps
    end
  end
end
