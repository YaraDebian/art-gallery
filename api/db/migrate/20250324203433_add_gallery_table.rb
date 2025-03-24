class AddGalleryTable < ActiveRecord::Migration[8.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :description
      t.string :image_url
      t.foreign_key :users, column: :user_id
      t.timestamps
    end
  end
end
