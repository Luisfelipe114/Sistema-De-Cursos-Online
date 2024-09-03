class Sales::Course < ApplicationRecord
  has_one_attached :picture #isso aqui tem relação com o active storage

  has_many :client_users_couses, class_name: "Client::UsersCourse", foreign_key: "sales_courses_id"
  has_many :sales_videos, class_name: "Sales::Video", foreign_key: "sales_courses_id"
  belongs_to :admin_categories, class_name: "Admin::Category", foreign_key:"admin_categories_id"

  validates_presence_of :nome
end