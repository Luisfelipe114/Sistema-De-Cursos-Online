class Admin::Address < ApplicationRecord
  belongs_to :admin_administrators, class_name: 'Admin::Administrator', foreign_key: 'admin_administrators_id' # fornece class_name e foreign_key para o rails pegar a referência correte; se não colocasse isso, ele iria buscar pela classe Administrator e pela foreign_ket administrator_id(que não é como tá definida lá no schema)
end
