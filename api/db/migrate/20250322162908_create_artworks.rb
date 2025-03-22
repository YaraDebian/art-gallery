class CreateArtworks < ActiveRecord::Migration[8.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :image_url
      t.references :artist, null: false, foreign_key: true
      t.references :art_movement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
