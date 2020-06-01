class AddUserToPetPlays < ActiveRecord::Migration[5.1]
  def change
    add_reference :pet_plays, :user, foreign_key: true
  end
end
