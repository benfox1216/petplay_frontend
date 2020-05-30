class AddZipColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :zipcode, :string
  end
end
