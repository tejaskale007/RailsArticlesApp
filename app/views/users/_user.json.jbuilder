json.extract! user, :id, :username, :string, :created_at, :updated_at
json.url user_url(user, format: :json)
