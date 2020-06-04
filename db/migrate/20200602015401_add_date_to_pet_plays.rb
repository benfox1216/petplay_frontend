class AddDateToPetPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :pet_plays, :date, :string
    add_column :pet_plays, :time, :string
  end
end
