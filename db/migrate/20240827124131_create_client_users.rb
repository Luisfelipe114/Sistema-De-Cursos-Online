class CreateClientUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :client_users do |t|
      t.string :nome
      t.string :telefone
      t.string :cpf
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
