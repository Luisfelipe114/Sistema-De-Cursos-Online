class CreateClientUsersCourses < ActiveRecord::Migration[7.1]
  def change
    create_table :client_users_courses do |t|
      t.references :client_users, null: false, foreign_key: true
      t.references :sales_courses, null: false, foreign_key: true

      t.timestamps
    end
  end
end
