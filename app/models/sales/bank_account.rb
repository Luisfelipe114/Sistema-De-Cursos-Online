class Sales::BankAccount < ApplicationRecord
  belongs_to :sales_sellers, class_name: 'Sales::Seller', foreign_key: 'sales_sellers_id'

  validates_presence_of :numero, :agencia, :banco

  validates :numero, uniqueness: { scope: :agencia }
end
