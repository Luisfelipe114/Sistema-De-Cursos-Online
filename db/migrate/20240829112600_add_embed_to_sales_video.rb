class AddEmbedToSalesVideo < ActiveRecord::Migration[7.1]
  def change
    add_column :sales_videos, :embed, :text
  end
end
