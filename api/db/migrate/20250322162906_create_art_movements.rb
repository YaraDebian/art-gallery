class CreateArtMovements < ActiveRecord::Migration[8.0]
  def change
    create_table :art_movements do |t|
      t.string :name
      t.text :description
      t.string :period

      t.timestamps
    end
  end
end
