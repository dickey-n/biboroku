class CreateMuseums < ActiveRecord::Migration[6.0]
  def change
    create_table :museums do |t|
      t.string :title,          null: false
      t.string :place,          null: false
      t.text :text,             null: false
      t.integer :prefecture_id, null: false
      t.integer :genre_id,      null: false
      t.string :artist,         null: false
      t.references :user,       null: false, foreign_key: true

      t.timestamps
    end
  end
end
