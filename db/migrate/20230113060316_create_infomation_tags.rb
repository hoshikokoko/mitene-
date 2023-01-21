class CreateInfomationTags < ActiveRecord::Migration[6.1]
  def change
    create_table :infomation_tags do |t|
      t.integer :infomation_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
