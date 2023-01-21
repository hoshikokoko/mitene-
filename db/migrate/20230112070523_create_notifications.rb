class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :infomation_id, null: false, foreign_key: true
      t.integer :infomation_comment_id, null: false, foreign_key: true
      t.integer :visiter_id, null: false
      t.integer :visited_id, null: false
      t.integer :action, null: false
      t.boolean :is_checked, null: false, default: false
      t.timestamps
    end
  end
end
