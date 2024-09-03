class AddUniqueConstraintToAdminCategory < ActiveRecord::Migration[7.1]
  def change
    add_index :admin_categories, :nome, unique: true
  end
end
