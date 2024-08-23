class Sales::BankAccount < ApplicationRecord
  belongs_to :sales_sellers, class_name: 'Sales::Seller', foreign_key: 'sales_sellers_id'
end
