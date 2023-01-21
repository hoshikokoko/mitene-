class CreateImfomations < ActiveRecord::Migration[6.1]
  def change
    create_table :imfomations do |t|
      t.integer :staff_id, null: false, foreign_key: true
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :priority, null: false, default: false
      t.timestamps
    end
  end
end
