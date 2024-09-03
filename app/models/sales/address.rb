class Sales::Address < ApplicationRecord
  belongs_to :sales_sellers, class_name: 'Sales::Seller', foreign_key: 'sales_sellers_id' # fornece class_name e foreign_key para o rails pegar a referência correte; se não colocasse isso, ele iria buscar pela classe Administrator e pela foreign_ket administrator_id(que não é como tá definida lá no schema)

  validates_presence_of :rua, :numero, :estado, :cep, :bairro
  validates :numero, uniqueness: { scope: :cep} # valida se a junção de numero e cep é única
end
