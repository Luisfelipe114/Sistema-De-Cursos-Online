class Admin::Administrator < ApplicationRecord
  has_many :admin_addresses, class_name: 'Admin::Address', foreign_key: 'admin_administrators_id'
  has_many :admin_bank_accounts, class_name: 'Admin::BankAccount', foreign_key: 'admin_administrators_id'
end
