class Sales::Seller < ApplicationRecord
  has_many :sales_addresses, class_name: 'Sales::Address', foreign_key: 'sales_sellers_id'
  has_many :sales_bank_accounts, class_name: 'Sales::BankAccount', foreign_key: 'sales_sellers_id'
end
