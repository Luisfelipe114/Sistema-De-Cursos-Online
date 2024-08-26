class Sales::Course < ApplicationRecord
  has_many :sales_videos, class_name: "Sales::Video", foreign_key: "sales_courses_id"
  belongs_to :admin_categories, class_name: "Admin::Category", foreign_key:"admin_categories_id"
end