class ChangeDatatypeAdminNumberOfAdmins < ActiveRecord::Migration[6.1]
  def change
    change_column :admins, :admin_number, :string
  end
end
