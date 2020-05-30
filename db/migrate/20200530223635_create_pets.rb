class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.string :type
      t.string :name
      t.integer :age
      t.string :breed
      t.string :size
    end
  end
end
