class RemoveTagsColumnFromPosts < ActiveRecord::Migration[5.0]
  def up
    remove_column :posts, :tags, :string
  end

  def down
    add_column :posts, :tags, :string
  end
end
