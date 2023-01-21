class RenameAdminNumberColumnToAdmins < ActiveRecord::Migration[6.1]
  def change
    rename_column :admins, :admin_number, :employee_number
  end
end
