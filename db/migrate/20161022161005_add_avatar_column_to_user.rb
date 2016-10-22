class AddAvatarColumnToUser < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :image, :string
  end

  def down
    remove_column :users, :image, :string
  end
end
