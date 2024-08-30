class Client::User < ApplicationRecord
  include ActiveModel::SecurePassword # para ter acesso aos métodos 

  has_many :client_users_courses, class_name: "Client::UsersCourse", foreign_key: "client_users_id"

  # Caso eu não queira fazer : Sales::Course.where(id: client_users_courses.pluck(:sales_courses_id)), eu poderia usar o has_many through
  # has_many :sales_courses, through: :client_users_courses # ou seja, tem muitos cursos pela relação de client_users_courses. Aí eu só acessaria diretamente por um @user.sales_courses
  
  has_secure_password # pega o campo password e salva como um password digest

  validates :password, presence: true, if: :password_required?

  def password_required?
    new_record? || !password.nil?
  end

  def courses
    Sales::Course.where(id: client_users_courses.pluck(:sales_courses_id)).joins(:sales_videos).distinct # joins para pegar apenas cursos que têm vídeos; # A palavra-chave distinct faz com que a consulta remova as duplicatas, garantindo que cada curso apareça apenas uma vez na lista de resultados, independentemente de quantos vídeos ele tenha.
  end
end
