class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :dish_weight
      t.integer :status

      t.timestamps
    end
  end
end
