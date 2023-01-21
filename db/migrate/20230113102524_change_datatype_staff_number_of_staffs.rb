class ChangeDatatypeStaffNumberOfStaffs < ActiveRecord::Migration[6.1]
  def change
    change_column :staffs, :staff_number, :string
  end
end
