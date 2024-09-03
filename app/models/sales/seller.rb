class Sales::Seller < ApplicationRecord
  include ActiveModel::SecurePassword # para ter acesso aos métodos 
  
  has_secure_password # pega o campo password e salva como um password digest

  has_many :sales_addresses, class_name: 'Sales::Address', foreign_key: 'sales_sellers_id'
  has_many :sales_bank_accounts, class_name: 'Sales::BankAccount', foreign_key: 'sales_sellers_id'
  has_many :sales_courses, class_name: 'Sales::Course', foreign_key: 'sales_sellers_id'

  validates :nome, :email, presence: true
  validates_uniqueness_of :email, :cpf

  validates :password, presence: true, if: :password_required?


  def password_required?
    new_record? || !password.nil?
  end
end
