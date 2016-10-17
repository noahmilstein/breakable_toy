class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :video, null: false
      t.string :body, null: false
      t.string :tags

      t.timestamps
    end
  end
end
