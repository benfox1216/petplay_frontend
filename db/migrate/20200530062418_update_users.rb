class UpdateUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:users, :zipcode, '00000')
  end
end
