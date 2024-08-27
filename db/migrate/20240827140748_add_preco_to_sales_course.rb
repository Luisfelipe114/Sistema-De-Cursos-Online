class AddPrecoToSalesCourse < ActiveRecord::Migration[7.1]
  def change
    add_column :sales_courses, :preco, :decimal
  end
end
