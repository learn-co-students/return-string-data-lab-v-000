json.array!(@products) do |product|
  json.extract! product, :id, :index, :new, :create
  json.url product_url(product, format: :json)
end
