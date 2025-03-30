class AddSharingTable < ActiveRecord::Migration[8.0]
  def change
    create_table :sharings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gallery, null: false, foreign_key: true
      t.timestamps
    end
  end
end
