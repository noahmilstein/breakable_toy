class CreateVideo < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title, null: false
      t.string :url, null: false
      t.string :description
      t.string :tags

      t.timestamps
    end
  end
end
