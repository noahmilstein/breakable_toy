class AddLatLongToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
  
  def down
    remove_column :users, :latitude, :string
    remove_column :users, :longitude, :string
  end
end
