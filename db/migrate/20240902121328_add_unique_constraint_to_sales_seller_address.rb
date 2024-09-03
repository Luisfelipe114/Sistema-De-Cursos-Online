class AddUniqueConstraintToSalesSellerAddress < ActiveRecord::Migration[7.1]
  def change
    add_index :sales_addresses, [:numero, :cep], unique: true # passando um array, ele passa a validar como unique a junção das colunas que foram passadas no array
  end
end
