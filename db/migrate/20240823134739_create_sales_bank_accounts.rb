class CreateSalesBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_bank_accounts do |t|
      t.integer :numero
      t.integer :agencia
      t.string :banco
      t.references :sales_sellers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
