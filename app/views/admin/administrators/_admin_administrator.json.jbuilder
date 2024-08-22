json.extract! admin_administrator, :id, :nome, :cpf, :telefone, :email, :senha, :created_at, :updated_at
json.url admin_administrator_url(admin_administrator, format: :json)
