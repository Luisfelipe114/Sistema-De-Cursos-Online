class Client::User < ApplicationRecord
  include ActiveModel::SecurePassword # para ter acesso aos métodos 

  has_many :client_users_courses, class_name: "Client::UsersCourse", foreign_key: "client_users_id"
  
  has_secure_password # pega o campo password e salva como um password digest

  validates :password, presence: true, if: :password_required?

  def password_required?
    new_record? || !password.nil?
  end

  def courses
    Sales::Course.where(id: client_users_courses.pluck(:sales_courses_id))
  end
end
