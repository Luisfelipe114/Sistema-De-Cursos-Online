class Sales::Video < ApplicationRecord
  belongs_to :sales_courses, class_name: "Sales::Course", foreign_key: "sales_courses_id"

  validates_presence_of :nome, :link
end
