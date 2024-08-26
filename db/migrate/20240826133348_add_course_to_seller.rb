class AddCourseToSeller < ActiveRecord::Migration[7.1]
  def change
    add_reference :sales_courses, :sales_sellers, null: false, foreign_key: true
  end
end
