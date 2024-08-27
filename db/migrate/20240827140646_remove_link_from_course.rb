class RemoveLinkFromCourse < ActiveRecord::Migration[7.1]
  def change
    remove_column :sales_courses, :link, :string
  end
end
