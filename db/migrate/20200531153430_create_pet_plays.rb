class CreatePetPlays < ActiveRecord::Migration[5.1]
  def change
    create_table :petplays do |t|
      t.string :title
      t.string :pet_players
      t.string :location
      t.timestamps
    end
  end
end
