class CreateMemos < ActiveRecord::Migration[6.0]
  def change
    create_table :memos do |t|
      t.text       :memo,       null: false
      t.references :user,       null: false, foreign_key: true
      t.references :museum,     null: false, foreign_key: true

      t.timestamps
    end
  end
end

