class Admin::Administrator < ApplicationRecord
  include ActiveModel::SecurePassword # para ter acesso aos métodos 
  
  has_secure_password # pega o campo password e salva como um password digest

  has_many :admin_addresses, class_name: 'Admin::Address', foreign_key: 'admin_administrators_id'
  has_many :admin_bank_accounts, class_name: 'Admin::BankAccount', foreign_key: 'admin_administrators_id'

  validates :password, presence: true, if: :password_required?


  def password_required?
    new_record? || !password.nil?
  end
end
