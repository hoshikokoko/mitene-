class RenameStaffNumberColumnToStaffs < ActiveRecord::Migration[6.1]
  def change
    rename_column :staffs, :staff_number, :employee_number
  end
end
