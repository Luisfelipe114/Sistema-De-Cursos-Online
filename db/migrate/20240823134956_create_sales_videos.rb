class CreateSalesVideos < ActiveRecord::Migration[7.1]
  def change
    create_table :sales_videos do |t|
      t.string :nome
      t.text :descricao
      t.string :link
      t.references :sales_courses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
