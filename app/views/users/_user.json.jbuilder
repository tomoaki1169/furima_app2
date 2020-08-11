json.extract! user, :id, :name, :public_uid, :created_at, :updated_at
json.url user_url(user, format: :json)
