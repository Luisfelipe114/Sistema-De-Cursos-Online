class CreateAdminBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :admin_bank_accounts do |t|
      t.integer :numero
      t.integer :agencia
      t.string :banco
      t.references :admin_administrators, null: false, foreign_key: true

      t.timestamps
    end
  end
end
