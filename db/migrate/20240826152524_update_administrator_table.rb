class UpdateAdministratorTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :admin_administrators, :senha
    add_column :admin_administrators, :password_digest, :string
  end
end
