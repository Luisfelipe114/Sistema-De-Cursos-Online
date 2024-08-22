class Admin::Address < ApplicationRecord
  belongs_to :admin_administrators, class_name: 'Admin::Administrator', foreign_key: 'admin_administrators_id'
end
