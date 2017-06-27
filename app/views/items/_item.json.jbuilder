json.extract! item, :id, :name, :alias, :describe, :bar_code, :status_id, :sector_id, :type_id, :image_id, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
