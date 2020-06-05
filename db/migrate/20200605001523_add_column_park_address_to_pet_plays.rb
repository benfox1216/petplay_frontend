class AddColumnParkAddressToPetPlays < ActiveRecord::Migration[5.1]
  def change
    add_column :petplays, :park_address, :string
  end
end
