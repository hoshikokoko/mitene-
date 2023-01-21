class CreateInfomationComments < ActiveRecord::Migration[6.1]
  def change
    create_table :infomation_comments do |t|
      t.integer :staff_id, null: false, foreign_key: true
      t.integer :infomation_id, null: false, foreign_key: true
      t.text :comment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
