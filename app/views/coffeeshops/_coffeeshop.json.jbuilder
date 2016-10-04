json.extract! coffeeshop, :id, :name, :address, :website, :description, :created_at, :updated_at
json.url coffeeshop_url(coffeeshop, format: :json)