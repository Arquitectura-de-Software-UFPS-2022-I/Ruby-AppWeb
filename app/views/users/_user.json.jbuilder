json.extract! user, :id, :name, :email, :username, :password, :signature_id, :modified_date, :created_date, :created_at, :updated_at
json.url user_url(user, format: :json)
