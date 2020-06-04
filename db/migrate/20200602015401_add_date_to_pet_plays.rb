class AddDateToPetPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :petplays, :date, :string
    add_column :petplays, :time, :string
  end
end
