class CreateArtists < ActiveRecord::Migration[8.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :biography
      t.date :birth_date
      t.date :death_date

      t.timestamps
    end
  end
end
