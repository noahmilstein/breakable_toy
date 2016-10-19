class RemoveTagsColumnFromVideos < ActiveRecord::Migration[5.0]
  def up
    remove_column :videos, :tags, :string
  end

  def down
    add_column :videos, :tags, :string
  end
end
