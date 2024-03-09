class CreatePersonCharacteristics < ActiveRecord::Migration[7.0]
  def change
    create_table :person_characteristics do |t|
      t.integer :genus
      t.integer :age
      t.integer :height
      t.integer :weight
      t.float :kof_activ
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
