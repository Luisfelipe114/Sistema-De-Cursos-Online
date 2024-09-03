class AddUniqueConstraintToClientUser < ActiveRecord::Migration[7.1]
  def change
    add_index :client_users, :cpf, unique: true
    add_index :client_users, :email, unique: true
  end
end
