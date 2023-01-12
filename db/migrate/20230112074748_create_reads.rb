class CreateReads < ActiveRecord::Migration[6.1]
  def change
    create_table :reads do |t|
      t.integer :staff_id, null: false, foreign_key: true
      t.integer :infomation_id, null: false, foreign_key: true
      t.boolean :is_completed, null: false, default: false
      t.timestamps
    end
  end
end
