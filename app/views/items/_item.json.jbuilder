json.extract! item, :id, :name, :alias, :describe, :bar_code, :type, :sector_id, :status, :created_at, :updated_at
json.url item_url(item, format: :json)
