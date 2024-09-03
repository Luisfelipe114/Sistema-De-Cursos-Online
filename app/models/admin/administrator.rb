class Admin::Administrator < ApplicationRecord
  include ActiveModel::SecurePassword # para ter acesso aos métodos 
  
  has_secure_password # pega o campo password e salva como um password digest

  validates :nome, :email, presence: true
  validates_uniqueness_of :email, :cpf
  validates :password, presence: true, if: :password_required?


  def password_required?
    new_record? || !password.nil?
  end
end
