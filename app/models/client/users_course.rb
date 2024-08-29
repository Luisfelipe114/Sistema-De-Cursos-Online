class Client::UsersCourse < ApplicationRecord
  belongs_to :client_users, class_name: "Client::User", foreign_key: "client_users_id"
  belongs_to :sales_courses, class_name: "Sales::Course", foreign_key: "sales_courses_id"
end
