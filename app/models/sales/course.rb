class Sales::Course < ApplicationRecord
  has_many :sales_videos, class_name: "Sales::Video", foreign_key: "sales_courses_id"
end
