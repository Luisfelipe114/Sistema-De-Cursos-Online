class Admin::Category < ApplicationRecord
  has_many :sales_courses, class_name: "Sales::Course", foreign_key: "admin_categories_id"

  validates :nome, presence: true, uniqueness: true
end