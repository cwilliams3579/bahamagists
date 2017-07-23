json.extract! listing, :id, :images, :title, :address, :description, :price, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
