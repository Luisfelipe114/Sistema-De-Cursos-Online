class CreateAdminAdministrators < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_administrators do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
