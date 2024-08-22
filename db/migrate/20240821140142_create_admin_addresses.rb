class CreateAdminAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_addresses do |t|
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cep
      t.string :estado
      t.references :admin_administrators, null: false, foreign_key: true

      t.timestamps
    end
  end
end
