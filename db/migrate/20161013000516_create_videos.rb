class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.belongs_to :user, null: false
      t.belongs_to :post, null: false
      t.string :title, null: false
      t.string :url, null: false
      t.string :embed_id
      t.string :tags

      t.timestamps
    end
  end
end
