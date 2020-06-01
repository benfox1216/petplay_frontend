class CreatePetPlays < ActiveRecord::Migration[5.1]
  def change
    create_table :pet_plays do |t|
      t.string :title
      t.string :pet_players
      t.string :location
      t.timestamps
    end
  end
end
