class RemoveCountryColumnFromUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :country, :string
  end

  def down
    add_column :users, :country, :string
  end
end
