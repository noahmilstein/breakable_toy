class RemoveTagsColumnFromComments < ActiveRecord::Migration[5.0]
  def up
    remove_column :comments, :tags, :string
  end

  def down
    add_column :comments, :tags, :string
  end
end
