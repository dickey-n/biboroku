class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :museum, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :museum_id], unique: true
    end
  end
end
