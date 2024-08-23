class CreateSalesAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_addresses do |t|
      t.string :rua
      t.string :numero
      t.string :bairro
      t.string :cep
      t.string :estado
      t.references :sales_sellers, null: false, foreign_key: true

      t.timestamps
    end
  end
end
