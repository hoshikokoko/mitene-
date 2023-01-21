class ChangeImfomationToInfomation < ActiveRecord::Migration[6.1]
  def change
    rename_table :imfomations, :infomations
  end
end
