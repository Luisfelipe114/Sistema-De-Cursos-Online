class AddUniqueConstraintEmailToAdminAdministrator < ActiveRecord::Migration[7.1]
  def change
    add_index :admin_administrators, :email, unique: true
  end
end
