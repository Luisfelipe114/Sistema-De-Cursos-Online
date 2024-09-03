class AddUniqueConstraintCpfToAdminAdministrator < ActiveRecord::Migration[7.1]
  def change
    add_index :admin_administrators, :cpf, unique: true
  end
end
