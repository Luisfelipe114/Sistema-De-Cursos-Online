class CreateSalesCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_courses do |t|
      t.string :nome
      t.text :descricao
      t.string :link

      t.timestamps
    end
  end
end
