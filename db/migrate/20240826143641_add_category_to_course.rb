class AddCategoryToCourse < ActiveRecord::Migration[7.1]
  def change
    add_reference :sales_courses, :admin_categories, null: false, foreign_key: true
  end
end
