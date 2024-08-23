class CreateSalesSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_sellers do |t|
      t.string :nome
      t.string :cpf
      t.string :telefone
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
