class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :species
      t.integer :age
      t.string :breed
      t.string :size
      t.timestamps
    end
  end
end
