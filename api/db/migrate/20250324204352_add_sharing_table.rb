class AddSharingTable < ActiveRecord::Migration[8.0]
  def change
    create_table :sharings do |t|
      t.foreign_key :users, column: :user_id
      t.foreign_key :galleries, column: :gallery_id
      t.timestamps
    end
  end
end
