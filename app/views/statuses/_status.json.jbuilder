json.extract! status, :id, :name, :describe, :created_at, :updated_at
json.url status_url(status, format: :json)
