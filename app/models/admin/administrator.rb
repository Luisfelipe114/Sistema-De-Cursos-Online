class Admin::Administrator < ApplicationRecord
  has_many :admin_addresses, class_name: 'Admin::Address', foreign_key: 'admin_administrators_id'
end
